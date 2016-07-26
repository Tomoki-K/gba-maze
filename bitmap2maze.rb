File.open('bitmap.txt') do |file|
  str = file.read.gsub(/(\r\n|\r|\n|\f)/,"")
  x = 0
  y = 0
  i = 0
  str.each_char do |char|
    print ("maze[" + y.to_s + "][" + x.to_s + "] = " + char + ";\n")
    i += 1
    x = i % 30
    y = i / 30
  end
end
