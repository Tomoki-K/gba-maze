// color pallet : http://stackoverflow.com/questions/13720937/c-defined-16bit-high-color
typedef volatile unsigned short hword;

#define VRAM 0x06000000
#define width  240
#define height 160
#define player_size  4
#define block_size   8
#define maze_width  30
#define maze_height 20
#define red    0x001F
#define pink	 0xF81F
#define orange 0x021F
#define blue   0x7C00
#define black  0x0000
#define white  0x7FFF
#define gray	 0xC618
#define true  1
#define false 0

// define draw methods
void draw_dot(int, int, hword);
void draw_point(int, int, hword);
void draw_block(hword, hword, hword);
void draw_portal(hword, hword, hword);
void draw_heart(int, int);
void draw_wall(hword);
void draw_bg(hword);
// void draw_title();
// void draw_ending();

// define move methods
int moveRight(int, int);
int moveLeft(int, int);
int moveUp(int, int);
int moveDown(int, int);

// define other stuff :/
void sleep(int);
hword maze[20][30];
hword on_portal(hword, hword, hword, hword);


// START HERE
int main(void) {
	hword *ptr;
	hword *btn_state;
	hword start = 0x0008;
	hword right = 0x0010;
	hword left  = 0x0020;
	hword up    = 0x0040;
	hword down  = 0x0080;
	hword r_key = 0x0100;
	hword l_key = 0x0200;
	// colors
	hword bg_color = white;
	hword player_color = red;
	hword wall_color = black;
	hword portal_in_color = blue;
	hword portal_out_color =  orange;
	int sleep_time;

	ptr = (hword*) 0x04000000;
	*ptr = 0xF03;

	// player position
	int X;
	int Y;
	int bufX;
	int bufY;

	while(1) {
		// draw_title();
		while(1) {
			btn_state = (hword*) 0x04000130;
			// press start to start
			if((*btn_state & start) == 0) {
				break;
			}
		}

    // setup stage
		draw_bg(bg_color);
		draw_wall(wall_color);
		// player starting position
		X = 8;
		Y = 8;

		while(1) {
			btn_state = (hword*) 0x04000130;
			bufX = X;
			bufY = Y;
			sleep_time = 10000; // speed (larger->slower)

			// alter speed
			/*
			if((*btn_state & r_key) == 0) {
			 	sleep_time = 5000;
			 } else if((*btn_state & l_key) == 0) {
			 	sleep_time = 20000;
			}
			*/

			// key control
			if((*btn_state & right) == 0) {
				X = moveRight(X, Y);
			}
			else if((*btn_state & left) == 0) {
				X = moveLeft(X, Y);
			}
			else if((*btn_state & up) == 0) {
				Y = moveUp(X, Y);
			}
			else if((*btn_state & down) == 0) {
				Y = moveDown(X, Y);
			}

      // portals : draw_block(x,  y, color);
			draw_portal( 5,  1, portal_in_color);		// 1 in
			draw_portal( 1,  3, portal_out_color);	// 1 out
			draw_portal( 9,  2, portal_in_color);		// 2 in
			draw_portal( 1, 18, portal_out_color);	// 2 out
			draw_portal( 6, 18, portal_in_color);		// 3 in
			draw_portal(28,  1, portal_out_color);	// 3 out
			draw_portal(18, 14, portal_in_color);		// 4 in
			draw_portal(16, 18, portal_out_color);	// 4 out
			draw_portal( 7, 16, portal_in_color);		// 5 in
			draw_portal( 9, 10, portal_out_color);	// 5 out
			draw_portal( 9,  4, portal_in_color);		// 6 in
			draw_portal(18, 10, portal_out_color);	// 6 out
			draw_portal(19,  7, portal_in_color);		// 7 in
			draw_portal(28, 14, portal_out_color);	// 7 out
			draw_heart(28, 18);											//goal

      // portal warp points
			if(on_portal(X, Y,  5,  1) == true) { // 1
				X = 1  * block_size;
				Y = 3  * block_size;
			}
			if(on_portal(X, Y,  9,  2) == true) { // 2
				X = 1  * block_size;
				Y = 18 * block_size;
			}
			if(on_portal(X, Y,  6,  18) == true) { // 3
				X = 28 * block_size;
				Y = 1  * block_size;
			}
			if(on_portal(X, Y, 18,  14) == true) { // 4
				X = 16 * block_size;
				Y = 18 * block_size;
			}
			if(on_portal(X, Y,  7, 16) == true) { // 5
				X = 9  * block_size;
				Y = 10 * block_size;
			}
			if(on_portal(X, Y,  9,  4) == true) { // 6
				X = 18 * block_size;
				Y = 10 * block_size;
			}
			if(on_portal(X, Y, 19,  7) == true) { // 7
				X = 28 * block_size;
				Y = 14 * block_size;
			}
			draw_point(bufX, bufY, bg_color);
			draw_point(X, Y, player_color);

			if(on_portal(X, Y, 28, 18) == true) {
				sleep(100000);
				draw_bg(bg_color);
				// draw_ending();
				break;
			}
			sleep(sleep_time);
		}

		while(1) {
			btn_state = (hword*) 0x04000130;
			// press start to play again
			if((*btn_state & start) == 0) {
				break;
			}
		}
	}
	return 0;
}

//check if player is on a portal
hword on_portal(hword x, hword y, hword xblock, hword yblock) {
	hword checkX = xblock * block_size;
	hword checkY = yblock * block_size;
	if(checkX<=x && checkY<=y && x<checkX + block_size-player_size+1 && y<checkY+block_size-player_size+1) {
		return true;
	} else {
		return false;
	}
}


/* ======== move methods ======== */

// move player towards right
int moveRight(int x, int y) {
	hword *ptr;
	hword isWall = false;
	int i;
	ptr = (hword*) VRAM + x + player_size + y * width;
	for(i = 0; i < player_size; i++) {
		if(*ptr == black) { // black => it's a wall!!
			isWall = true;
			break;
		}
		ptr += width;
	}
	if(isWall == false) {
		return ++x; // move 1 point to right
	} else {
		return x; // do nothing
	}
}

// move player towards left
int moveLeft(int x, int y) {
	hword *ptr;
	hword isWall = false;
	int i;
	ptr = (hword*) VRAM + x - 1 + y * width;
	for(i = 0; i < player_size; i++) {
		if(*ptr == black) {
			isWall = true;
			break;
		}
		ptr += width;
	}
	if(isWall == false) {
		return --x;
	} else {
		return x;
	}
}

// move player upwards
int moveUp(int x, int y) {
	hword *ptr;
	hword isWall = false;
	int i;
	ptr = (hword*) VRAM + x + (y - 1) * width;
	for(i = 0; i < player_size; i++) {
		if(*ptr == black) {
			isWall = true;
			break;
		}
		ptr++;
	}
	if(isWall == false) {
		return --y;
	} else {
		return y;
	}
}

// move player downwards
int moveDown(int x, int y) {
	hword *ptr;
	hword isWall = false;
	int i;
	ptr = (hword*) VRAM + x + (y + player_size) * width;
	for(i = 0; i < player_size; i++) {
		if(*ptr == black) {
			isWall = true;
			break;
		}
		ptr++;
	}
	if(isWall == false) {
		return ++y;
	} else {
		return y;
	}
}

/* ======== draw methods ======== */

// draw 1x1 pixel "dot"
void draw_dot(int x, int y, hword color) {
	hword *ptr;
	ptr = (hword*) VRAM + x + y * 240;
	*ptr = color;
}

// draw 2x2 pixel "point"
void draw_point(int x, int y, hword color) {
	hword *ptr;
	int ptrX = x;
	int ptrY = y;
	ptr = (hword*) VRAM + ptrX + ptrY * width;
	for(ptrY = 0; ptrY < player_size; ptrY++) {
		for(ptrX = 0; ptrX < player_size; ptrX++) {
			*ptr = color;
			ptr++;
		}
		ptr = ptr + width - player_size;
	}
}

// draw 8x8 pixel "block"
void draw_block(hword x, hword y, hword color) {
	hword *ptr;
	int i, j;
	ptr = (hword*) VRAM + x * block_size + y * block_size * width;
	for(j = 0; j < block_size; j++) {
		for(i = 0; i < block_size; i++) {
			*ptr = color;
			ptr++;
		}
		ptr = ptr + width - block_size;
	}
}

// draw 8x8 portal
void draw_portal(hword x, hword y, hword color) {
	hword *ptr;
	int i, j;
	ptr = (hword*) VRAM + x * block_size + y * block_size * width;
	for(j = 0; j < block_size; j++) {
		for(i = 0; i < block_size; i++) {
			if (i == 0 || i == 1 || i == 6 || i == 7 || j == 0 || j == 1 || j == 6 || j == 7) {
				*ptr = color;
			}
			ptr++;
		}
		ptr = ptr + width - block_size;
	}
}

// draw heart box at goalpoint
void draw_heart(int x, int y) {
	hword PtrX = x * block_size;
 	hword ptrY = y * block_size;
	draw_block(x, y, gray);
	draw_dot(PtrX+1, ptrY+1, pink);
	draw_dot(PtrX+2, ptrY+1, pink);
	draw_dot(PtrX+5, ptrY+1, pink);
	draw_dot(PtrX+6, ptrY+1, pink);
	draw_dot(PtrX+0, ptrY+2, pink);
	draw_dot(PtrX+1, ptrY+2, pink);
	draw_dot(PtrX+2, ptrY+2, pink);
	draw_dot(PtrX+3, ptrY+2, pink);
	draw_dot(PtrX+4, ptrY+2, pink);
	draw_dot(PtrX+5, ptrY+2, pink);
	draw_dot(PtrX+6, ptrY+2, pink);
	draw_dot(PtrX+7, ptrY+2, pink);
	draw_dot(PtrX+0, ptrY+3, pink);
	draw_dot(PtrX+1, ptrY+3, pink);
	draw_dot(PtrX+2, ptrY+3, pink);
	draw_dot(PtrX+3, ptrY+3, pink);
	draw_dot(PtrX+4, ptrY+3, pink);
	draw_dot(PtrX+5, ptrY+3, pink);
	draw_dot(PtrX+6, ptrY+3, pink);
	draw_dot(PtrX+7, ptrY+3, pink);
	draw_dot(PtrX+1, ptrY+4, pink);
	draw_dot(PtrX+2, ptrY+4, pink);
	draw_dot(PtrX+3, ptrY+4, pink);
	draw_dot(PtrX+4, ptrY+4, pink);
	draw_dot(PtrX+5, ptrY+4, pink);
	draw_dot(PtrX+6, ptrY+4, pink);
	draw_dot(PtrX+2, ptrY+5, pink);
	draw_dot(PtrX+3, ptrY+5, pink);
	draw_dot(PtrX+4, ptrY+5, pink);
	draw_dot(PtrX+5, ptrY+5, pink);
	draw_dot(PtrX+3, ptrY+6, pink);
	draw_dot(PtrX+4, ptrY+6, pink);
}

// draw maze walls
void draw_wall(hword color) {
	int i, j;

	maze[0][0] = 1;
	maze[0][1] = 1;
	maze[0][2] = 1;
	maze[0][3] = 1;
	maze[0][4] = 1;
	maze[0][5] = 1;
	maze[0][6] = 1;
	maze[0][7] = 1;
	maze[0][8] = 1;
	maze[0][9] = 1;
	maze[0][10] = 1;
	maze[0][11] = 1;
	maze[0][12] = 1;
	maze[0][13] = 1;
	maze[0][14] = 1;
	maze[0][15] = 1;
	maze[0][16] = 1;
	maze[0][17] = 1;
	maze[0][18] = 1;
	maze[0][19] = 1;
	maze[0][20] = 1;
	maze[0][21] = 1;
	maze[0][22] = 1;
	maze[0][23] = 1;
	maze[0][24] = 1;
	maze[0][25] = 1;
	maze[0][26] = 1;
	maze[0][27] = 1;
	maze[0][28] = 1;
	maze[0][29] = 1;
	maze[1][0] = 1;
	maze[1][1] = 0;
	maze[1][2] = 0;
	maze[1][3] = 0;
	maze[1][4] = 0;
	maze[1][5] = 0;
	maze[1][6] = 1;
	maze[1][7] = 0;
	maze[1][8] = 0;
	maze[1][9] = 0;
	maze[1][10] = 1;
	maze[1][11] = 0;
	maze[1][12] = 0;
	maze[1][13] = 0;
	maze[1][14] = 0;
	maze[1][15] = 1;
	maze[1][16] = 0;
	maze[1][17] = 0;
	maze[1][18] = 0;
	maze[1][19] = 0;
	maze[1][20] = 0;
	maze[1][21] = 0;
	maze[1][22] = 0;
	maze[1][23] = 0;
	maze[1][24] = 0;
	maze[1][25] = 1;
	maze[1][26] = 0;
	maze[1][27] = 0;
	maze[1][28] = 0;
	maze[1][29] = 1;
	maze[2][0] = 1;
	maze[2][1] = 1;
	maze[2][2] = 1;
	maze[2][3] = 1;
	maze[2][4] = 1;
	maze[2][5] = 1;
	maze[2][6] = 1;
	maze[2][7] = 0;
	maze[2][8] = 1;
	maze[2][9] = 0;
	maze[2][10] = 1;
	maze[2][11] = 0;
	maze[2][12] = 1;
	maze[2][13] = 1;
	maze[2][14] = 0;
	maze[2][15] = 1;
	maze[2][16] = 1;
	maze[2][17] = 1;
	maze[2][18] = 1;
	maze[2][19] = 1;
	maze[2][20] = 0;
	maze[2][21] = 1;
	maze[2][22] = 1;
	maze[2][23] = 1;
	maze[2][24] = 0;
	maze[2][25] = 1;
	maze[2][26] = 0;
	maze[2][27] = 1;
	maze[2][28] = 1;
	maze[2][29] = 1;
	maze[3][0] = 1;
	maze[3][1] = 0;
	maze[3][2] = 1;
	maze[3][3] = 0;
	maze[3][4] = 1;
	maze[3][5] = 0;
	maze[3][6] = 0;
	maze[3][7] = 0;
	maze[3][8] = 1;
	maze[3][9] = 1;
	maze[3][10] = 1;
	maze[3][11] = 0;
	maze[3][12] = 1;
	maze[3][13] = 0;
	maze[3][14] = 0;
	maze[3][15] = 0;
	maze[3][16] = 0;
	maze[3][17] = 1;
	maze[3][18] = 0;
	maze[3][19] = 0;
	maze[3][20] = 0;
	maze[3][21] = 0;
	maze[3][22] = 1;
	maze[3][23] = 0;
	maze[3][24] = 0;
	maze[3][25] = 1;
	maze[3][26] = 0;
	maze[3][27] = 0;
	maze[3][28] = 0;
	maze[3][29] = 1;
	maze[4][0] = 1;
	maze[4][1] = 0;
	maze[4][2] = 1;
	maze[4][3] = 0;
	maze[4][4] = 1;
	maze[4][5] = 1;
	maze[4][6] = 1;
	maze[4][7] = 0;
	maze[4][8] = 1;
	maze[4][9] = 0;
	maze[4][10] = 0;
	maze[4][11] = 0;
	maze[4][12] = 1;
	maze[4][13] = 0;
	maze[4][14] = 1;
	maze[4][15] = 1;
	maze[4][16] = 1;
	maze[4][17] = 1;
	maze[4][18] = 0;
	maze[4][19] = 1;
	maze[4][20] = 1;
	maze[4][21] = 1;
	maze[4][22] = 1;
	maze[4][23] = 0;
	maze[4][24] = 1;
	maze[4][25] = 1;
	maze[4][26] = 1;
	maze[4][27] = 1;
	maze[4][28] = 0;
	maze[4][29] = 1;
	maze[5][0] = 1;
	maze[5][1] = 0;
	maze[5][2] = 1;
	maze[5][3] = 0;
	maze[5][4] = 0;
	maze[5][5] = 0;
	maze[5][6] = 1;
	maze[5][7] = 0;
	maze[5][8] = 1;
	maze[5][9] = 1;
	maze[5][10] = 1;
	maze[5][11] = 1;
	maze[5][12] = 1;
	maze[5][13] = 0;
	maze[5][14] = 0;
	maze[5][15] = 0;
	maze[5][16] = 0;
	maze[5][17] = 1;
	maze[5][18] = 0;
	maze[5][19] = 0;
	maze[5][20] = 0;
	maze[5][21] = 0;
	maze[5][22] = 1;
	maze[5][23] = 0;
	maze[5][24] = 0;
	maze[5][25] = 0;
	maze[5][26] = 0;
	maze[5][27] = 0;
	maze[5][28] = 0;
	maze[5][29] = 1;
	maze[6][0] = 1;
	maze[6][1] = 0;
	maze[6][2] = 1;
	maze[6][3] = 0;
	maze[6][4] = 1;
	maze[6][5] = 0;
	maze[6][6] = 1;
	maze[6][7] = 0;
	maze[6][8] = 1;
	maze[6][9] = 0;
	maze[6][10] = 0;
	maze[6][11] = 0;
	maze[6][12] = 0;
	maze[6][13] = 0;
	maze[6][14] = 1;
	maze[6][15] = 1;
	maze[6][16] = 1;
	maze[6][17] = 1;
	maze[6][18] = 1;
	maze[6][19] = 1;
	maze[6][20] = 1;
	maze[6][21] = 0;
	maze[6][22] = 1;
	maze[6][23] = 1;
	maze[6][24] = 1;
	maze[6][25] = 1;
	maze[6][26] = 1;
	maze[6][27] = 1;
	maze[6][28] = 1;
	maze[6][29] = 1;
	maze[7][0] = 1;
	maze[7][1] = 0;
	maze[7][2] = 1;
	maze[7][3] = 0;
	maze[7][4] = 1;
	maze[7][5] = 0;
	maze[7][6] = 1;
	maze[7][7] = 0;
	maze[7][8] = 1;
	maze[7][9] = 0;
	maze[7][10] = 1;
	maze[7][11] = 1;
	maze[7][12] = 1;
	maze[7][13] = 1;
	maze[7][14] = 1;
	maze[7][15] = 0;
	maze[7][16] = 0;
	maze[7][17] = 0;
	maze[7][18] = 0;
	maze[7][19] = 0;
	maze[7][20] = 1;
	maze[7][21] = 0;
	maze[7][22] = 0;
	maze[7][23] = 0;
	maze[7][24] = 0;
	maze[7][25] = 0;
	maze[7][26] = 0;
	maze[7][27] = 0;
	maze[7][28] = 0;
	maze[7][29] = 1;
	maze[8][0] = 1;
	maze[8][1] = 0;
	maze[8][2] = 1;
	maze[8][3] = 0;
	maze[8][4] = 1;
	maze[8][5] = 0;
	maze[8][6] = 1;
	maze[8][7] = 0;
	maze[8][8] = 1;
	maze[8][9] = 0;
	maze[8][10] = 0;
	maze[8][11] = 0;
	maze[8][12] = 1;
	maze[8][13] = 0;
	maze[8][14] = 1;
	maze[8][15] = 0;
	maze[8][16] = 1;
	maze[8][17] = 1;
	maze[8][18] = 1;
	maze[8][19] = 1;
	maze[8][20] = 1;
	maze[8][21] = 1;
	maze[8][22] = 1;
	maze[8][23] = 1;
	maze[8][24] = 1;
	maze[8][25] = 1;
	maze[8][26] = 1;
	maze[8][27] = 1;
	maze[8][28] = 0;
	maze[8][29] = 1;
	maze[9][0] = 1;
	maze[9][1] = 0;
	maze[9][2] = 0;
	maze[9][3] = 0;
	maze[9][4] = 1;
	maze[9][5] = 0;
	maze[9][6] = 1;
	maze[9][7] = 0;
	maze[9][8] = 1;
	maze[9][9] = 1;
	maze[9][10] = 1;
	maze[9][11] = 0;
	maze[9][12] = 1;
	maze[9][13] = 0;
	maze[9][14] = 0;
	maze[9][15] = 0;
	maze[9][16] = 0;
	maze[9][17] = 0;
	maze[9][18] = 0;
	maze[9][19] = 1;
	maze[9][20] = 0;
	maze[9][21] = 0;
	maze[9][22] = 0;
	maze[9][23] = 1;
	maze[9][24] = 0;
	maze[9][25] = 0;
	maze[9][26] = 0;
	maze[9][27] = 1;
	maze[9][28] = 0;
	maze[9][29] = 1;
	maze[10][0] = 1;
	maze[10][1] = 1;
	maze[10][2] = 1;
	maze[10][3] = 1;
	maze[10][4] = 1;
	maze[10][5] = 0;
	maze[10][6] = 1;
	maze[10][7] = 0;
	maze[10][8] = 1;
	maze[10][9] = 0;
	maze[10][10] = 1;
	maze[10][11] = 0;
	maze[10][12] = 1;
	maze[10][13] = 0;
	maze[10][14] = 1;
	maze[10][15] = 1;
	maze[10][16] = 1;
	maze[10][17] = 1;
	maze[10][18] = 0;
	maze[10][19] = 1;
	maze[10][20] = 0;
	maze[10][21] = 1;
	maze[10][22] = 0;
	maze[10][23] = 1;
	maze[10][24] = 0;
	maze[10][25] = 1;
	maze[10][26] = 0;
	maze[10][27] = 1;
	maze[10][28] = 0;
	maze[10][29] = 1;
	maze[11][0] = 1;
	maze[11][1] = 0;
	maze[11][2] = 0;
	maze[11][3] = 0;
	maze[11][4] = 0;
	maze[11][5] = 0;
	maze[11][6] = 1;
	maze[11][7] = 0;
	maze[11][8] = 1;
	maze[11][9] = 0;
	maze[11][10] = 0;
	maze[11][11] = 0;
	maze[11][12] = 1;
	maze[11][13] = 0;
	maze[11][14] = 0;
	maze[11][15] = 0;
	maze[11][16] = 0;
	maze[11][17] = 1;
	maze[11][18] = 1;
	maze[11][19] = 1;
	maze[11][20] = 0;
	maze[11][21] = 1;
	maze[11][22] = 0;
	maze[11][23] = 1;
	maze[11][24] = 0;
	maze[11][25] = 1;
	maze[11][26] = 0;
	maze[11][27] = 1;
	maze[11][28] = 0;
	maze[11][29] = 1;
	maze[12][0] = 1;
	maze[12][1] = 0;
	maze[12][2] = 1;
	maze[12][3] = 1;
	maze[12][4] = 1;
	maze[12][5] = 1;
	maze[12][6] = 1;
	maze[12][7] = 0;
	maze[12][8] = 1;
	maze[12][9] = 1;
	maze[12][10] = 1;
	maze[12][11] = 1;
	maze[12][12] = 1;
	maze[12][13] = 1;
	maze[12][14] = 1;
	maze[12][15] = 1;
	maze[12][16] = 0;
	maze[12][17] = 0;
	maze[12][18] = 0;
	maze[12][19] = 0;
	maze[12][20] = 0;
	maze[12][21] = 1;
	maze[12][22] = 0;
	maze[12][23] = 1;
	maze[12][24] = 0;
	maze[12][25] = 1;
	maze[12][26] = 0;
	maze[12][27] = 0;
	maze[12][28] = 0;
	maze[12][29] = 1;
	maze[13][0] = 1;
	maze[13][1] = 0;
	maze[13][2] = 0;
	maze[13][3] = 0;
	maze[13][4] = 0;
	maze[13][5] = 0;
	maze[13][6] = 1;
	maze[13][7] = 0;
	maze[13][8] = 1;
	maze[13][9] = 0;
	maze[13][10] = 0;
	maze[13][11] = 0;
	maze[13][12] = 0;
	maze[13][13] = 1;
	maze[13][14] = 0;
	maze[13][15] = 0;
	maze[13][16] = 0;
	maze[13][17] = 1;
	maze[13][18] = 1;
	maze[13][19] = 1;
	maze[13][20] = 1;
	maze[13][21] = 1;
	maze[13][22] = 0;
	maze[13][23] = 1;
	maze[13][24] = 0;
	maze[13][25] = 1;
	maze[13][26] = 1;
	maze[13][27] = 1;
	maze[13][28] = 1;
	maze[13][29] = 1;
	maze[14][0] = 1;
	maze[14][1] = 1;
	maze[14][2] = 1;
	maze[14][3] = 1;
	maze[14][4] = 1;
	maze[14][5] = 0;
	maze[14][6] = 0;
	maze[14][7] = 0;
	maze[14][8] = 1;
	maze[14][9] = 0;
	maze[14][10] = 1;
	maze[14][11] = 1;
	maze[14][12] = 0;
	maze[14][13] = 1;
	maze[14][14] = 0;
	maze[14][15] = 1;
	maze[14][16] = 1;
	maze[14][17] = 1;
	maze[14][18] = 0;
	maze[14][19] = 1;
	maze[14][20] = 0;
	maze[14][21] = 1;
	maze[14][22] = 0;
	maze[14][23] = 1;
	maze[14][24] = 0;
	maze[14][25] = 0;
	maze[14][26] = 0;
	maze[14][27] = 1;
	maze[14][28] = 0;
	maze[14][29] = 1;
	maze[15][0] = 1;
	maze[15][1] = 0;
	maze[15][2] = 0;
	maze[15][3] = 0;
	maze[15][4] = 1;
	maze[15][5] = 0;
	maze[15][6] = 1;
	maze[15][7] = 1;
	maze[15][8] = 1;
	maze[15][9] = 0;
	maze[15][10] = 0;
	maze[15][11] = 1;
	maze[15][12] = 0;
	maze[15][13] = 1;
	maze[15][14] = 0;
	maze[15][15] = 1;
	maze[15][16] = 0;
	maze[15][17] = 1;
	maze[15][18] = 0;
	maze[15][19] = 1;
	maze[15][20] = 0;
	maze[15][21] = 1;
	maze[15][22] = 0;
	maze[15][23] = 1;
	maze[15][24] = 1;
	maze[15][25] = 1;
	maze[15][26] = 0;
	maze[15][27] = 1;
	maze[15][28] = 0;
	maze[15][29] = 1;
	maze[16][0] = 1;
	maze[16][1] = 0;
	maze[16][2] = 1;
	maze[16][3] = 0;
	maze[16][4] = 1;
	maze[16][5] = 0;
	maze[16][6] = 1;
	maze[16][7] = 0;
	maze[16][8] = 0;
	maze[16][9] = 1;
	maze[16][10] = 0;
	maze[16][11] = 1;
	maze[16][12] = 0;
	maze[16][13] = 1;
	maze[16][14] = 0;
	maze[16][15] = 1;
	maze[16][16] = 0;
	maze[16][17] = 0;
	maze[16][18] = 0;
	maze[16][19] = 1;
	maze[16][20] = 0;
	maze[16][21] = 1;
	maze[16][22] = 0;
	maze[16][23] = 0;
	maze[16][24] = 0;
	maze[16][25] = 0;
	maze[16][26] = 0;
	maze[16][27] = 1;
	maze[16][28] = 0;
	maze[16][29] = 1;
	maze[17][0] = 1;
	maze[17][1] = 0;
	maze[17][2] = 1;
	maze[17][3] = 0;
	maze[17][4] = 1;
	maze[17][5] = 1;
	maze[17][6] = 1;
	maze[17][7] = 1;
	maze[17][8] = 0;
	maze[17][9] = 1;
	maze[17][10] = 0;
	maze[17][11] = 1;
	maze[17][12] = 1;
	maze[17][13] = 1;
	maze[17][14] = 1;
	maze[17][15] = 1;
	maze[17][16] = 1;
	maze[17][17] = 1;
	maze[17][18] = 0;
	maze[17][19] = 1;
	maze[17][20] = 0;
	maze[17][21] = 1;
	maze[17][22] = 1;
	maze[17][23] = 1;
	maze[17][24] = 1;
	maze[17][25] = 1;
	maze[17][26] = 0;
	maze[17][27] = 1;
	maze[17][28] = 0;
	maze[17][29] = 1;
	maze[18][0] = 1;
	maze[18][1] = 0;
	maze[18][2] = 1;
	maze[18][3] = 0;
	maze[18][4] = 0;
	maze[18][5] = 0;
	maze[18][6] = 0;
	maze[18][7] = 1;
	maze[18][8] = 0;
	maze[18][9] = 0;
	maze[18][10] = 0;
	maze[18][11] = 0;
	maze[18][12] = 0;
	maze[18][13] = 0;
	maze[18][14] = 0;
	maze[18][15] = 0;
	maze[18][16] = 0;
	maze[18][17] = 1;
	maze[18][18] = 0;
	maze[18][19] = 0;
	maze[18][20] = 0;
	maze[18][21] = 0;
	maze[18][22] = 0;
	maze[18][23] = 0;
	maze[18][24] = 0;
	maze[18][25] = 0;
	maze[18][26] = 0;
	maze[18][27] = 1;
	maze[18][28] = 0;
	maze[18][29] = 1;
	maze[19][0] = 1;
	maze[19][1] = 1;
	maze[19][2] = 1;
	maze[19][3] = 1;
	maze[19][4] = 1;
	maze[19][5] = 1;
	maze[19][6] = 1;
	maze[19][7] = 1;
	maze[19][8] = 1;
	maze[19][9] = 1;
	maze[19][10] = 1;
	maze[19][11] = 1;
	maze[19][12] = 1;
	maze[19][13] = 1;
	maze[19][14] = 1;
	maze[19][15] = 1;
	maze[19][16] = 1;
	maze[19][17] = 1;
	maze[19][18] = 1;
	maze[19][19] = 1;
	maze[19][20] = 1;
	maze[19][21] = 1;
	maze[19][22] = 1;
	maze[19][23] = 1;
	maze[19][24] = 1;
	maze[19][25] = 1;
	maze[19][26] = 1;
	maze[19][27] = 1;
	maze[19][28] = 1;
	maze[19][29] = 1;


	for(j = 0; j < maze_height; j++) {
		for(i = 0; i < maze_width; i++) {
			if(maze[j][i] == 1) {
				draw_block(i, j, color);
			}
		}
	}
}

// draw background
void draw_bg(hword color) {
	hword *ptr;
	int i;
	ptr = (hword*) VRAM;
	for(i = 0; i < 38400; i++) {
		*ptr = color;
		ptr++;
	}
}

/*
// draw title screen
void draw_title() {
}

// draw ending screen
void draw_ending() {
}
*/

void sleep(int sleep_time) {
	int i;
	for(i = 0; i < sleep_time; i++);
}
