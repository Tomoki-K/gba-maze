File.open('title_bitmap.txt') do |file|
  str = file.read.gsub(/(\r\n|\r|\n|\f)/,"")
  x = 0
  y = 0
  i = 0
  str.each_char do |char|
    if char.to_s == 1.to_s
      print ("draw_point2(" + x.to_s + ", " + y.to_s + ", white);\n")
    elsif char.to_s == 2.to_s
      print ("draw_point2(" + x.to_s + ", " + y.to_s + ", orange);\n")
    elsif char.to_s == 3.to_s
      print ("draw_point2(" + x.to_s + ", " + y.to_s + ", blue);\n")
    end
    # draw_point(int x, int y, hword color)
    i += 1
    x = i % 120
    y = i / 120
  end
end
