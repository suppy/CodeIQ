#
# 【文字数×文字種】ペナルティ を算出する
#

# p ARGV[0]
file_name = ARGV[0]

File.open(file_name) do |f|
	while line = f.gets
		h = {}
		# p line
		next if line == "print \"\\n\"\n"
		line.chop!.split('').each do |c|
			if h[c] == nil
				h[c] = 1
			elsif
				h[c] += 1
			end
		end
		print "#{line}\n"
		p h
		print "#{line.length} × #{h.length}\n"
		print "【文字数×文字種】ペナルティ:#{line.length * h.length}\n\n"
	end
end
