File.open('block_bitmap.txt') do |file|
  str = file.read.gsub(/(\r\n|\r|\n|\f)/,"")
  bx = 29 # block x
  by = 19 # block y
  i = 0

  print("hword startX = x*block_size-(block_size-1);\n")
  print("hword startY = y+block_size-(block_size-1);\n\n")
  str.each_char do |char|
    px = i % 8
    py = i / 8
    str = char.to_s
    if str == 1.to_s then
      color = "pink"
    else
      color = "bg_color"
    end

    print("draw_point(startX+" + px.to_s + ", startY+" + py.to_s + ", " + color + ");\n")
    i += 1

  end
end
