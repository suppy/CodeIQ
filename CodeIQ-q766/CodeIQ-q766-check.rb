filename1 = "CodeIQ-q766.rb"
filename2 = "CodeIQ-q766.py"
filename3 = "CodeIQ-q766.js"

moji1 = []
File::open(filename1) do |f|
	while c = f.getc
		moji1 << c
	end
end
print moji1.join('')
print "\n"

moji2 = []
File::open(filename2) do |f|
	while c = f.getc
		moji2 << c
	end
end
print moji2.join('')
print "\n"

moji3 = []
File::open(filename3) do |f|
	while c = f.getc
		moji3 << c
	end
end
print moji3.join('')
print "\n"

p (moji1 & moji2) | (moji2 & moji3) | (moji3 & moji1)
p ((moji1 & moji2) | (moji2 & moji3) | (moji3 & moji1)).sort
p ((moji1 & moji2) | (moji2 & moji3) | (moji3 & moji1)).length

