# coding:utf-8
#
# 【文字数×(重複文字数+1)】ペナルティ を算出する
#

# p ARGV[0]
file_name = ARGV[0]

h = {}
line_length = 0
File.open(file_name) do |f|
	while line = f.gets
		h = {}
		# p line
#		next if line == "print \"\\n\"\n"
		line.chop!.split('').each do |c|
#		line.split('').each do |c|
			if h[c] == nil
				h[c] = 1
			elsif
				h[c] += 1
			end
		end
		print "#{line}\n"
		line_length = line.length
		p h
#		print "#{line.length} × #{h.length}\n"
#		print "【文字数×(重複文字数+1)】ペナルティ:#{line.length * h.length}\n\n"
#		p h
		duplicate = 0
		h.each do |key, value|
			duplicate += value - 1	
		end
		print "#{line_length} x #{duplicate + 1}\n"
		print "【文字数×(重複文字数+1)】ペナルティ:#{line_length * (duplicate + 1)}\n\n"
	end
end
