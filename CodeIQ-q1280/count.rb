filename = ARGV[0]

File.open(filename, "r") do |f|
  text = f.read
  p text.length
end