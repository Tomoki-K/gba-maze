/*
INFORMATION SYSTEM EXPERIMENT (Theme 3)
Group 10 (1G151013 Shuki Higashi, 1G151026 Tomoki Kano)
===============================================================
GitHub Repo : https://github.com/Tomoki-K/portalMaze-for-gba.git

reference:
 - color pallet : http://stackoverflow.com/questions/13720937/c-defined-16bit-high-color
*/
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
#define gray  0x0000
#define white  0x7FFF
#define gray	 0x56B5
#define true  1
#define false 0
#define speed 10000 // gba:500, emulator:10000

// define draw methods
void draw_dot(int, int, hword);
void draw_point2(int, int, hword);
void draw_point(int, int, hword);
void draw_block(hword, hword, hword);
void draw_portal(hword, hword, hword);
void draw_heart(int, int);
void draw_wall(hword);
void draw_bg(hword);
void draw_title();
void draw_ending();

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
	hword a_button = 0x0001;
	hword right = 0x0010;
	hword left  = 0x0020;
	hword up    = 0x0040;
	hword down  = 0x0080;
	// colors
	hword bg_color = white;
	hword player_color = red;
	hword wall_color = gray;
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
		draw_title();
		while(1) {
			btn_state = (hword*) 0x04000130;
			// press A or 'start' to start
			if((*btn_state & a_button) == 0 || (*btn_state & start) == 0) {
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
			sleep_time = speed;

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
				Y = 4  * block_size;
			}
			if(on_portal(X, Y, 1, 3) == true){
					X = 4 * block_size;
					Y = 1 * block_size;
			}
			if(on_portal(X, Y,  9,  2) == true) { // 2
				X = 1  * block_size;
				Y = 17 * block_size;
			}
			if(on_portal(X, Y, 1, 18) == true){
					X = 9 * block_size;
					Y = 1 * block_size;
			}
			if(on_portal(X, Y,  6,  18) == true) { // 3
				X = 27 * block_size;
				Y = 1  * block_size;
			}
			if(on_portal(X, Y, 28, 1) == true){
					X = 5 * block_size;
					Y = 18 * block_size;
			}
			if(on_portal(X, Y, 18,  14) == true) { // 4
				X = 15 * block_size;
				Y = 18 * block_size;
			}
			if(on_portal(X, Y, 16, 18) == true){
					X = 18 * block_size;
					Y = 15 * block_size;
			}
			if(on_portal(X, Y,  7, 16) == true) { // 5
				X = 9  * block_size;
				Y = 11 * block_size;
			}
			if(on_portal(X, Y, 9, 10) == true){
					X = 8 * block_size;
					Y = 16 * block_size;
			}
			if(on_portal(X, Y,  9,  4) == true) { // 6
				X = 18 * block_size;
				Y = 9 * block_size;
			}
			if(on_portal(X, Y, 18, 10) == true){
					X = 10 * block_size;
					Y = 4 * block_size;
			}
			if(on_portal(X, Y, 19,  7) == true) { // 7
				X = 28 * block_size;
				Y = 15 * block_size;
			}
			if(on_portal(X, Y, 28, 14) == true){
					X = 18 * block_size;
					Y = 7 * block_size;
			}
			draw_point(bufX, bufY, bg_color);	// player position before warp
			draw_point(X, Y, player_color);	// player position after warp

			if(on_portal(X, Y, 28, 18) == true) {
				sleep(100000);
				draw_bg(bg_color);
				draw_ending();
				break;
			}
			sleep(sleep_time);
		}

		while(1) {
			btn_state = (hword*) 0x04000130;
			// press A or 'start' to play again
			if((*btn_state & a_button) == 0 || (*btn_state & start) == 0) {
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
		if(*ptr == gray) { // gray => it's a wall!!
			isWall = true;
			break;
		}
		ptr += width; // change address
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
		if(*ptr == gray) {
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
		if(*ptr == gray) {
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
		if(*ptr == gray) {
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
	ptr = (hword*) VRAM + x + y * width;
	*ptr = color;
}

// draw 2x2 pixel "point"
void draw_point2(int x, int y, hword color) {
	hword *ptr;
	int i, j;
	ptr = (hword*) VRAM + x * 2 + y * 2 * width;
	for(j = 0; j < 2; j++) {
		for(i = 0; i < 2; i++) {
			*ptr = color;
			ptr++;
		}
		ptr = ptr + width - 2;
	}
}

// draw 4x4 pixel "point"
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
	maze[9][14] = 1;
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

// draw title screen
void draw_title() {
	draw_bg(gray);
	draw_point2(98, 15, orange);
	draw_point2(98, 16, orange);
	draw_point2(98, 17, orange);
	draw_point2(98, 18, orange);
	draw_point2(104, 18, white);
	draw_point2(105, 18, white);
	draw_point2(98, 19, orange);
	draw_point2(102, 19, white);
	draw_point2(103, 19, white);
	draw_point2(104, 19, white);
	draw_point2(105, 19, white);
	draw_point2(106, 19, white);
	draw_point2(107, 19, white);
	draw_point2(98, 20, orange);
	draw_point2(102, 20, white);
	draw_point2(103, 20, white);
	draw_point2(104, 20, white);
	draw_point2(105, 20, white);
	draw_point2(106, 20, white);
	draw_point2(107, 20, white);
	draw_point2(98, 21, orange);
	draw_point2(101, 21, white);
	draw_point2(102, 21, white);
	draw_point2(103, 21, white);
	draw_point2(104, 21, white);
	draw_point2(105, 21, white);
	draw_point2(106, 21, white);
	draw_point2(107, 21, white);
	draw_point2(108, 21, white);
	draw_point2(98, 22, orange);
	draw_point2(101, 22, white);
	draw_point2(102, 22, white);
	draw_point2(103, 22, white);
	draw_point2(104, 22, white);
	draw_point2(105, 22, white);
	draw_point2(106, 22, white);
	draw_point2(107, 22, white);
	draw_point2(108, 22, white);
	draw_point2(98, 23, orange);
	draw_point2(102, 23, white);
	draw_point2(103, 23, white);
	draw_point2(104, 23, white);
	draw_point2(105, 23, white);
	draw_point2(106, 23, white);
	draw_point2(107, 23, white);
	draw_point2(98, 24, orange);
	draw_point2(99, 24, white);
	draw_point2(102, 24, white);
	draw_point2(103, 24, white);
	draw_point2(104, 24, white);
	draw_point2(105, 24, white);
	draw_point2(106, 24, white);
	draw_point2(107, 24, white);
	draw_point2(13, 25, white);
	draw_point2(14, 25, white);
	draw_point2(15, 25, white);
	draw_point2(16, 25, white);
	draw_point2(17, 25, white);
	draw_point2(18, 25, white);
	draw_point2(19, 25, white);
	draw_point2(20, 25, white);
	draw_point2(30, 25, blue);
	draw_point2(31, 25, blue);
	draw_point2(32, 25, blue);
	draw_point2(33, 25, blue);
	draw_point2(42, 25, white);
	draw_point2(43, 25, white);
	draw_point2(44, 25, white);
	draw_point2(45, 25, white);
	draw_point2(46, 25, white);
	draw_point2(47, 25, white);
	draw_point2(48, 25, white);
	draw_point2(49, 25, white);
	draw_point2(56, 25, white);
	draw_point2(57, 25, white);
	draw_point2(58, 25, white);
	draw_point2(59, 25, white);
	draw_point2(60, 25, white);
	draw_point2(61, 25, white);
	draw_point2(62, 25, white);
	draw_point2(63, 25, white);
	draw_point2(64, 25, white);
	draw_point2(65, 25, white);
	draw_point2(73, 25, white);
	draw_point2(82, 25, white);
	draw_point2(83, 25, white);
	draw_point2(98, 25, orange);
	draw_point2(99, 25, white);
	draw_point2(100, 25, white);
	draw_point2(104, 25, white);
	draw_point2(105, 25, white);
	draw_point2(13, 26, white);
	draw_point2(14, 26, white);
	draw_point2(15, 26, white);
	draw_point2(16, 26, white);
	draw_point2(17, 26, white);
	draw_point2(18, 26, white);
	draw_point2(19, 26, white);
	draw_point2(20, 26, white);
	draw_point2(21, 26, white);
	draw_point2(28, 26, blue);
	draw_point2(29, 26, blue);
	draw_point2(30, 26, blue);
	draw_point2(31, 26, blue);
	draw_point2(32, 26, blue);
	draw_point2(33, 26, blue);
	draw_point2(34, 26, blue);
	draw_point2(35, 26, blue);
	draw_point2(42, 26, white);
	draw_point2(43, 26, white);
	draw_point2(44, 26, white);
	draw_point2(45, 26, white);
	draw_point2(46, 26, white);
	draw_point2(47, 26, white);
	draw_point2(48, 26, white);
	draw_point2(49, 26, white);
	draw_point2(50, 26, white);
	draw_point2(56, 26, white);
	draw_point2(57, 26, white);
	draw_point2(58, 26, white);
	draw_point2(59, 26, white);
	draw_point2(60, 26, white);
	draw_point2(61, 26, white);
	draw_point2(62, 26, white);
	draw_point2(63, 26, white);
	draw_point2(64, 26, white);
	draw_point2(65, 26, white);
	draw_point2(72, 26, white);
	draw_point2(73, 26, white);
	draw_point2(74, 26, white);
	draw_point2(82, 26, white);
	draw_point2(83, 26, white);
	draw_point2(98, 26, orange);
	draw_point2(99, 26, white);
	draw_point2(100, 26, white);
	draw_point2(101, 26, white);
	draw_point2(13, 27, white);
	draw_point2(14, 27, white);
	draw_point2(20, 27, white);
	draw_point2(21, 27, white);
	draw_point2(22, 27, white);
	draw_point2(27, 27, blue);
	draw_point2(28, 27, blue);
	draw_point2(35, 27, blue);
	draw_point2(36, 27, blue);
	draw_point2(42, 27, white);
	draw_point2(43, 27, white);
	draw_point2(49, 27, white);
	draw_point2(50, 27, white);
	draw_point2(51, 27, white);
	draw_point2(60, 27, white);
	draw_point2(61, 27, white);
	draw_point2(72, 27, white);
	draw_point2(73, 27, white);
	draw_point2(74, 27, white);
	draw_point2(82, 27, white);
	draw_point2(83, 27, white);
	draw_point2(98, 27, orange);
	draw_point2(99, 27, white);
	draw_point2(100, 27, white);
	draw_point2(101, 27, white);
	draw_point2(102, 27, white);
	draw_point2(13, 28, white);
	draw_point2(14, 28, white);
	draw_point2(21, 28, white);
	draw_point2(22, 28, white);
	draw_point2(26, 28, blue);
	draw_point2(27, 28, blue);
	draw_point2(36, 28, blue);
	draw_point2(37, 28, blue);
	draw_point2(42, 28, white);
	draw_point2(43, 28, white);
	draw_point2(50, 28, white);
	draw_point2(51, 28, white);
	draw_point2(60, 28, white);
	draw_point2(61, 28, white);
	draw_point2(71, 28, white);
	draw_point2(72, 28, white);
	draw_point2(74, 28, white);
	draw_point2(75, 28, white);
	draw_point2(82, 28, white);
	draw_point2(83, 28, white);
	draw_point2(98, 28, orange);
	draw_point2(99, 28, white);
	draw_point2(100, 28, white);
	draw_point2(101, 28, white);
	draw_point2(102, 28, white);
	draw_point2(103, 28, white);
	draw_point2(13, 29, white);
	draw_point2(14, 29, white);
	draw_point2(21, 29, white);
	draw_point2(22, 29, white);
	draw_point2(26, 29, blue);
	draw_point2(27, 29, blue);
	draw_point2(36, 29, blue);
	draw_point2(37, 29, blue);
	draw_point2(42, 29, white);
	draw_point2(43, 29, white);
	draw_point2(50, 29, white);
	draw_point2(51, 29, white);
	draw_point2(60, 29, white);
	draw_point2(61, 29, white);
	draw_point2(71, 29, white);
	draw_point2(72, 29, white);
	draw_point2(74, 29, white);
	draw_point2(75, 29, white);
	draw_point2(82, 29, white);
	draw_point2(83, 29, white);
	draw_point2(98, 29, orange);
	draw_point2(99, 29, white);
	draw_point2(100, 29, white);
	draw_point2(101, 29, white);
	draw_point2(102, 29, white);
	draw_point2(103, 29, white);
	draw_point2(13, 30, white);
	draw_point2(14, 30, white);
	draw_point2(21, 30, white);
	draw_point2(22, 30, white);
	draw_point2(26, 30, blue);
	draw_point2(27, 30, blue);
	draw_point2(36, 30, blue);
	draw_point2(37, 30, blue);
	draw_point2(42, 30, white);
	draw_point2(43, 30, white);
	draw_point2(50, 30, white);
	draw_point2(51, 30, white);
	draw_point2(60, 30, white);
	draw_point2(61, 30, white);
	draw_point2(71, 30, white);
	draw_point2(75, 30, white);
	draw_point2(82, 30, white);
	draw_point2(83, 30, white);
	draw_point2(98, 30, orange);
	draw_point2(99, 30, white);
	draw_point2(100, 30, white);
	draw_point2(101, 30, white);
	draw_point2(102, 30, white);
	draw_point2(103, 30, white);
	draw_point2(13, 31, white);
	draw_point2(14, 31, white);
	draw_point2(20, 31, white);
	draw_point2(21, 31, white);
	draw_point2(26, 31, blue);
	draw_point2(27, 31, blue);
	draw_point2(36, 31, blue);
	draw_point2(37, 31, blue);
	draw_point2(42, 31, white);
	draw_point2(43, 31, white);
	draw_point2(49, 31, white);
	draw_point2(50, 31, white);
	draw_point2(60, 31, white);
	draw_point2(61, 31, white);
	draw_point2(70, 31, white);
	draw_point2(71, 31, white);
	draw_point2(75, 31, white);
	draw_point2(76, 31, white);
	draw_point2(82, 31, white);
	draw_point2(83, 31, white);
	draw_point2(98, 31, orange);
	draw_point2(99, 31, white);
	draw_point2(100, 31, white);
	draw_point2(101, 31, white);
	draw_point2(102, 31, white);
	draw_point2(103, 31, white);
	draw_point2(13, 32, white);
	draw_point2(14, 32, white);
	draw_point2(15, 32, white);
	draw_point2(16, 32, white);
	draw_point2(17, 32, white);
	draw_point2(18, 32, white);
	draw_point2(19, 32, white);
	draw_point2(20, 32, white);
	draw_point2(21, 32, white);
	draw_point2(26, 32, blue);
	draw_point2(27, 32, blue);
	draw_point2(36, 32, blue);
	draw_point2(37, 32, blue);
	draw_point2(42, 32, white);
	draw_point2(43, 32, white);
	draw_point2(44, 32, white);
	draw_point2(45, 32, white);
	draw_point2(46, 32, white);
	draw_point2(47, 32, white);
	draw_point2(48, 32, white);
	draw_point2(49, 32, white);
	draw_point2(50, 32, white);
	draw_point2(60, 32, white);
	draw_point2(61, 32, white);
	draw_point2(70, 32, white);
	draw_point2(71, 32, white);
	draw_point2(75, 32, white);
	draw_point2(76, 32, white);
	draw_point2(82, 32, white);
	draw_point2(83, 32, white);
	draw_point2(98, 32, orange);
	draw_point2(99, 32, white);
	draw_point2(100, 32, white);
	draw_point2(102, 32, white);
	draw_point2(103, 32, white);
	draw_point2(104, 32, white);
	draw_point2(13, 33, white);
	draw_point2(14, 33, white);
	draw_point2(26, 33, blue);
	draw_point2(27, 33, blue);
	draw_point2(36, 33, blue);
	draw_point2(37, 33, blue);
	draw_point2(42, 33, white);
	draw_point2(43, 33, white);
	draw_point2(49, 33, white);
	draw_point2(60, 33, white);
	draw_point2(61, 33, white);
	draw_point2(70, 33, white);
	draw_point2(71, 33, white);
	draw_point2(72, 33, white);
	draw_point2(73, 33, white);
	draw_point2(74, 33, white);
	draw_point2(75, 33, white);
	draw_point2(76, 33, white);
	draw_point2(82, 33, white);
	draw_point2(83, 33, white);
	draw_point2(98, 33, orange);
	draw_point2(99, 33, white);
	draw_point2(102, 33, white);
	draw_point2(103, 33, white);
	draw_point2(104, 33, white);
	draw_point2(13, 34, white);
	draw_point2(14, 34, white);
	draw_point2(26, 34, blue);
	draw_point2(27, 34, blue);
	draw_point2(36, 34, blue);
	draw_point2(37, 34, blue);
	draw_point2(42, 34, white);
	draw_point2(43, 34, white);
	draw_point2(49, 34, white);
	draw_point2(50, 34, white);
	draw_point2(60, 34, white);
	draw_point2(61, 34, white);
	draw_point2(69, 34, white);
	draw_point2(70, 34, white);
	draw_point2(71, 34, white);
	draw_point2(72, 34, white);
	draw_point2(73, 34, white);
	draw_point2(74, 34, white);
	draw_point2(75, 34, white);
	draw_point2(76, 34, white);
	draw_point2(77, 34, white);
	draw_point2(82, 34, white);
	draw_point2(83, 34, white);
	draw_point2(98, 34, orange);
	draw_point2(103, 34, white);
	draw_point2(104, 34, white);
	draw_point2(105, 34, white);
	draw_point2(13, 35, white);
	draw_point2(14, 35, white);
	draw_point2(26, 35, blue);
	draw_point2(27, 35, blue);
	draw_point2(36, 35, blue);
	draw_point2(37, 35, blue);
	draw_point2(42, 35, white);
	draw_point2(43, 35, white);
	draw_point2(50, 35, white);
	draw_point2(51, 35, white);
	draw_point2(60, 35, white);
	draw_point2(61, 35, white);
	draw_point2(69, 35, white);
	draw_point2(70, 35, white);
	draw_point2(76, 35, white);
	draw_point2(77, 35, white);
	draw_point2(82, 35, white);
	draw_point2(83, 35, white);
	draw_point2(98, 35, orange);
	draw_point2(104, 35, white);
	draw_point2(105, 35, white);
	draw_point2(106, 35, white);
	draw_point2(13, 36, white);
	draw_point2(14, 36, white);
	draw_point2(27, 36, blue);
	draw_point2(28, 36, blue);
	draw_point2(35, 36, blue);
	draw_point2(36, 36, blue);
	draw_point2(42, 36, white);
	draw_point2(43, 36, white);
	draw_point2(50, 36, white);
	draw_point2(51, 36, white);
	draw_point2(60, 36, white);
	draw_point2(61, 36, white);
	draw_point2(69, 36, white);
	draw_point2(77, 36, white);
	draw_point2(82, 36, white);
	draw_point2(83, 36, white);
	draw_point2(98, 36, orange);
	draw_point2(105, 36, white);
	draw_point2(106, 36, white);
	draw_point2(107, 36, white);
	draw_point2(108, 36, white);
	draw_point2(13, 37, white);
	draw_point2(14, 37, white);
	draw_point2(28, 37, blue);
	draw_point2(29, 37, blue);
	draw_point2(30, 37, blue);
	draw_point2(31, 37, blue);
	draw_point2(32, 37, blue);
	draw_point2(33, 37, blue);
	draw_point2(34, 37, blue);
	draw_point2(35, 37, blue);
	draw_point2(42, 37, white);
	draw_point2(43, 37, white);
	draw_point2(50, 37, white);
	draw_point2(51, 37, white);
	draw_point2(60, 37, white);
	draw_point2(61, 37, white);
	draw_point2(68, 37, white);
	draw_point2(69, 37, white);
	draw_point2(77, 37, white);
	draw_point2(78, 37, white);
	draw_point2(82, 37, white);
	draw_point2(83, 37, white);
	draw_point2(98, 37, orange);
	draw_point2(106, 37, white);
	draw_point2(107, 37, white);
	draw_point2(108, 37, white);
	draw_point2(13, 38, white);
	draw_point2(14, 38, white);
	draw_point2(30, 38, blue);
	draw_point2(31, 38, blue);
	draw_point2(32, 38, blue);
	draw_point2(33, 38, blue);
	draw_point2(42, 38, white);
	draw_point2(43, 38, white);
	draw_point2(50, 38, white);
	draw_point2(51, 38, white);
	draw_point2(60, 38, white);
	draw_point2(61, 38, white);
	draw_point2(68, 38, white);
	draw_point2(69, 38, white);
	draw_point2(77, 38, white);
	draw_point2(78, 38, white);
	draw_point2(82, 38, white);
	draw_point2(83, 38, white);
	draw_point2(84, 38, white);
	draw_point2(85, 38, white);
	draw_point2(86, 38, white);
	draw_point2(87, 38, white);
	draw_point2(88, 38, white);
	draw_point2(89, 38, white);
	draw_point2(90, 38, white);
	draw_point2(98, 38, orange);
	draw_point2(99, 38, white);
	draw_point2(98, 39, orange);
	draw_point2(99, 39, white);
	draw_point2(100, 39, white);
	draw_point2(98, 40, orange);
	draw_point2(99, 40, white);
	draw_point2(100, 40, white);
	draw_point2(101, 40, white);
	draw_point2(98, 41, orange);
	draw_point2(99, 41, white);
	draw_point2(100, 41, white);
	draw_point2(101, 41, white);
	draw_point2(102, 41, white);
	draw_point2(98, 42, orange);
	draw_point2(100, 42, white);
	draw_point2(101, 42, white);
	draw_point2(102, 42, white);
	draw_point2(98, 43, orange);
	draw_point2(99, 43, white);
	draw_point2(100, 43, white);
	draw_point2(101, 43, white);
	draw_point2(98, 44, orange);
	draw_point2(99, 44, white);
	draw_point2(100, 44, white);
	draw_point2(98, 45, orange);
	draw_point2(99, 45, white);
	draw_point2(98, 46, orange);
	draw_point2(98, 47, orange);
	draw_point2(98, 48, orange);
	draw_point2(54, 58, white);
	draw_point2(55, 58, white);
	draw_point2(53, 59, white);
	draw_point2(56, 59, white);
	draw_point2(62, 59, white);
	draw_point2(73, 59, white);
	draw_point2(89, 59, white);
	draw_point2(26, 60, white);
	draw_point2(27, 60, white);
	draw_point2(28, 60, white);
	draw_point2(31, 60, white);
	draw_point2(33, 60, white);
	draw_point2(34, 60, white);
	draw_point2(37, 60, white);
	draw_point2(38, 60, white);
	draw_point2(42, 60, white);
	draw_point2(43, 60, white);
	draw_point2(44, 60, white);
	draw_point2(47, 60, white);
	draw_point2(48, 60, white);
	draw_point2(49, 60, white);
	draw_point2(53, 60, white);
	draw_point2(56, 60, white);
	draw_point2(61, 60, white);
	draw_point2(62, 60, white);
	draw_point2(63, 60, white);
	draw_point2(66, 60, white);
	draw_point2(67, 60, white);
	draw_point2(73, 60, white);
	draw_point2(74, 60, white);
	draw_point2(75, 60, white);
	draw_point2(79, 60, white);
	draw_point2(80, 60, white);
	draw_point2(84, 60, white);
	draw_point2(85, 60, white);
	draw_point2(91, 60, white);
	draw_point2(92, 60, white);
	draw_point2(93, 60, white);
	draw_point2(26, 61, white);
	draw_point2(29, 61, white);
	draw_point2(31, 61, white);
	draw_point2(32, 61, white);
	draw_point2(36, 61, white);
	draw_point2(39, 61, white);
	draw_point2(41, 61, white);
	draw_point2(46, 61, white);
	draw_point2(53, 61, white);
	draw_point2(56, 61, white);
	draw_point2(62, 61, white);
	draw_point2(65, 61, white);
	draw_point2(68, 61, white);
	draw_point2(73, 61, white);
	draw_point2(76, 61, white);
	draw_point2(78, 61, white);
	draw_point2(81, 61, white);
	draw_point2(83, 61, white);
	draw_point2(86, 61, white);
	draw_point2(89, 61, white);
	draw_point2(91, 61, white);
	draw_point2(94, 61, white);
	draw_point2(18, 62, white);
	draw_point2(19, 62, white);
	draw_point2(20, 62, white);
	draw_point2(21, 62, white);
	draw_point2(22, 62, white);
	draw_point2(26, 62, white);
	draw_point2(29, 62, white);
	draw_point2(31, 62, white);
	draw_point2(36, 62, white);
	draw_point2(37, 62, white);
	draw_point2(38, 62, white);
	draw_point2(39, 62, white);
	draw_point2(42, 62, white);
	draw_point2(43, 62, white);
	draw_point2(46, 62, white);
	draw_point2(47, 62, white);
	draw_point2(48, 62, white);
	draw_point2(53, 62, white);
	draw_point2(54, 62, white);
	draw_point2(55, 62, white);
	draw_point2(56, 62, white);
	draw_point2(62, 62, white);
	draw_point2(65, 62, white);
	draw_point2(68, 62, white);
	draw_point2(73, 62, white);
	draw_point2(76, 62, white);
	draw_point2(78, 62, white);
	draw_point2(79, 62, white);
	draw_point2(80, 62, white);
	draw_point2(81, 62, white);
	draw_point2(83, 62, white);
	draw_point2(86, 62, white);
	draw_point2(89, 62, white);
	draw_point2(91, 62, white);
	draw_point2(94, 62, white);
	draw_point2(98, 62, white);
	draw_point2(99, 62, white);
	draw_point2(100, 62, white);
	draw_point2(101, 62, white);
	draw_point2(102, 62, white);
	draw_point2(26, 63, white);
	draw_point2(29, 63, white);
	draw_point2(31, 63, white);
	draw_point2(36, 63, white);
	draw_point2(44, 63, white);
	draw_point2(49, 63, white);
	draw_point2(53, 63, white);
	draw_point2(56, 63, white);
	draw_point2(62, 63, white);
	draw_point2(65, 63, white);
	draw_point2(68, 63, white);
	draw_point2(73, 63, white);
	draw_point2(76, 63, white);
	draw_point2(78, 63, white);
	draw_point2(83, 63, white);
	draw_point2(86, 63, white);
	draw_point2(89, 63, white);
	draw_point2(91, 63, white);
	draw_point2(94, 63, white);
	draw_point2(26, 64, white);
	draw_point2(27, 64, white);
	draw_point2(28, 64, white);
	draw_point2(31, 64, white);
	draw_point2(37, 64, white);
	draw_point2(38, 64, white);
	draw_point2(41, 64, white);
	draw_point2(42, 64, white);
	draw_point2(43, 64, white);
	draw_point2(46, 64, white);
	draw_point2(47, 64, white);
	draw_point2(48, 64, white);
	draw_point2(53, 64, white);
	draw_point2(56, 64, white);
	draw_point2(62, 64, white);
	draw_point2(63, 64, white);
	draw_point2(66, 64, white);
	draw_point2(67, 64, white);
	draw_point2(73, 64, white);
	draw_point2(74, 64, white);
	draw_point2(75, 64, white);
	draw_point2(79, 64, white);
	draw_point2(80, 64, white);
	draw_point2(84, 64, white);
	draw_point2(85, 64, white);
	draw_point2(86, 64, white);
	draw_point2(89, 64, white);
	draw_point2(91, 64, white);
	draw_point2(94, 64, white);
	draw_point2(26, 65, white);
	draw_point2(86, 65, white);
	draw_point2(26, 66, white);
	draw_point2(84, 66, white);
	draw_point2(85, 66, white);


}

// draw ending screen
void draw_ending() {
	draw_bg(gray);
	draw_point2(27, 37, white);
	draw_point2(28, 37, white);
	draw_point2(29, 37, white);
	draw_point2(32, 37, white);
	draw_point2(33, 37, white);
	draw_point2(34, 37, white);
	draw_point2(35, 37, white);
	draw_point2(36, 37, white);
	draw_point2(39, 37, white);
	draw_point2(40, 37, white);
	draw_point2(41, 37, white);
	draw_point2(45, 37, white);
	draw_point2(46, 37, white);
	draw_point2(47, 37, white);
	draw_point2(50, 37, white);
	draw_point2(51, 37, white);
	draw_point2(52, 37, white);
	draw_point2(53, 37, white);
	draw_point2(54, 37, white);
	draw_point2(60, 37, white);
	draw_point2(61, 37, white);
	draw_point2(62, 37, white);
	draw_point2(65, 37, white);
	draw_point2(71, 37, white);
	draw_point2(72, 37, white);
	draw_point2(73, 37, white);
	draw_point2(74, 37, white);
	draw_point2(75, 37, white);
	draw_point2(78, 37, white);
	draw_point2(79, 37, white);
	draw_point2(80, 37, white);
	draw_point2(83, 37, white);
	draw_point2(84, 37, white);
	draw_point2(85, 37, white);
	draw_point2(86, 37, white);
	draw_point2(90, 37, white);
	draw_point2(93, 37, white);
	draw_point2(26, 38, white);
	draw_point2(30, 38, white);
	draw_point2(34, 38, white);
	draw_point2(38, 38, white);
	draw_point2(42, 38, white);
	draw_point2(44, 38, white);
	draw_point2(48, 38, white);
	draw_point2(50, 38, white);
	draw_point2(59, 38, white);
	draw_point2(63, 38, white);
	draw_point2(65, 38, white);
	draw_point2(71, 38, white);
	draw_point2(77, 38, white);
	draw_point2(81, 38, white);
	draw_point2(83, 38, white);
	draw_point2(87, 38, white);
	draw_point2(90, 38, white);
	draw_point2(93, 38, white);
	draw_point2(26, 39, white);
	draw_point2(34, 39, white);
	draw_point2(38, 39, white);
	draw_point2(42, 39, white);
	draw_point2(44, 39, white);
	draw_point2(50, 39, white);
	draw_point2(59, 39, white);
	draw_point2(65, 39, white);
	draw_point2(71, 39, white);
	draw_point2(77, 39, white);
	draw_point2(81, 39, white);
	draw_point2(83, 39, white);
	draw_point2(87, 39, white);
	draw_point2(90, 39, white);
	draw_point2(93, 39, white);
	draw_point2(27, 40, white);
	draw_point2(28, 40, white);
	draw_point2(29, 40, white);
	draw_point2(34, 40, white);
	draw_point2(38, 40, white);
	draw_point2(39, 40, white);
	draw_point2(40, 40, white);
	draw_point2(41, 40, white);
	draw_point2(42, 40, white);
	draw_point2(44, 40, white);
	draw_point2(46, 40, white);
	draw_point2(47, 40, white);
	draw_point2(48, 40, white);
	draw_point2(50, 40, white);
	draw_point2(51, 40, white);
	draw_point2(52, 40, white);
	draw_point2(53, 40, white);
	draw_point2(54, 40, white);
	draw_point2(59, 40, white);
	draw_point2(65, 40, white);
	draw_point2(71, 40, white);
	draw_point2(72, 40, white);
	draw_point2(73, 40, white);
	draw_point2(74, 40, white);
	draw_point2(75, 40, white);
	draw_point2(77, 40, white);
	draw_point2(78, 40, white);
	draw_point2(79, 40, white);
	draw_point2(80, 40, white);
	draw_point2(81, 40, white);
	draw_point2(83, 40, white);
	draw_point2(84, 40, white);
	draw_point2(85, 40, white);
	draw_point2(86, 40, white);
	draw_point2(90, 40, white);
	draw_point2(93, 40, white);
	draw_point2(30, 41, white);
	draw_point2(34, 41, white);
	draw_point2(38, 41, white);
	draw_point2(42, 41, white);
	draw_point2(44, 41, white);
	draw_point2(48, 41, white);
	draw_point2(50, 41, white);
	draw_point2(59, 41, white);
	draw_point2(65, 41, white);
	draw_point2(71, 41, white);
	draw_point2(77, 41, white);
	draw_point2(81, 41, white);
	draw_point2(83, 41, white);
	draw_point2(86, 41, white);
	draw_point2(90, 41, white);
	draw_point2(93, 41, white);
	draw_point2(26, 42, white);
	draw_point2(30, 42, white);
	draw_point2(34, 42, white);
	draw_point2(38, 42, white);
	draw_point2(42, 42, white);
	draw_point2(44, 42, white);
	draw_point2(48, 42, white);
	draw_point2(50, 42, white);
	draw_point2(59, 42, white);
	draw_point2(63, 42, white);
	draw_point2(65, 42, white);
	draw_point2(71, 42, white);
	draw_point2(77, 42, white);
	draw_point2(81, 42, white);
	draw_point2(83, 42, white);
	draw_point2(87, 42, white);
	draw_point2(27, 43, white);
	draw_point2(28, 43, white);
	draw_point2(29, 43, white);
	draw_point2(34, 43, white);
	draw_point2(38, 43, white);
	draw_point2(42, 43, white);
	draw_point2(45, 43, white);
	draw_point2(46, 43, white);
	draw_point2(47, 43, white);
	draw_point2(50, 43, white);
	draw_point2(51, 43, white);
	draw_point2(52, 43, white);
	draw_point2(53, 43, white);
	draw_point2(54, 43, white);
	draw_point2(60, 43, white);
	draw_point2(61, 43, white);
	draw_point2(62, 43, white);
	draw_point2(65, 43, white);
	draw_point2(66, 43, white);
	draw_point2(67, 43, white);
	draw_point2(68, 43, white);
	draw_point2(69, 43, white);
	draw_point2(71, 43, white);
	draw_point2(72, 43, white);
	draw_point2(73, 43, white);
	draw_point2(74, 43, white);
	draw_point2(75, 43, white);
	draw_point2(77, 43, white);
	draw_point2(81, 43, white);
	draw_point2(83, 43, white);
	draw_point2(87, 43, white);
	draw_point2(90, 43, white);
	draw_point2(93, 43, white);
}

void sleep(int sleep_time) {
	int i;
	for(i = 0; i < sleep_time; i++);
}
