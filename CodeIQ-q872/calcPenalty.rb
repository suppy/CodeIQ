#
# 【文字数×文字種】ペナルティ を算出する
#

p ARGV[0]
file_name = ARGV[0]

h = {}
lines = ""

File.open(file_name) do |f|
	lines = f.read
end
# p lines

lines.split('').each do |c|
	if h[c] == nil
		h[c] = 1
	elsif
		h[c] += 1
	end
end

p lines
p h
p lines.length
p h.length
print "【文字数×文字種】ペナルティ:#{lines.length * h.length}"
