File.open('block_bitmap.txt') do |file|
  str = file.read.gsub(/(\r\n|\r|\n|\f)/,"")
  bx = 29 # block x
  by = 19 # block y
  i = 0

  print("hword ptrX = x * block_size;\n")
  print("hword ptrY = y * block_size;\n")
  str.each_char do |char|
    px = i % 8
    py = i / 8
    str = char.to_s
    if str == 1.to_s then
      color = "pink"
    else
      color = "gray"
    end

    print("draw_point(ptrX+" + px.to_s + ", ptrY+" + py.to_s + ", " + color + ");\n")
    i += 1

  end
end
