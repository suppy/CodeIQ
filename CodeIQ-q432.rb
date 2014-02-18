#a = [3, 1, 4, 10, 5, 9, 2, 6, 8, 7]

#p a

cross = 0
a = []

p Time.now

#File.open("sample-q432.txt", "r") { |file|
File.open("crossing-q432.txt", "r") { |file|
	b = file.readlines
	b.each { |str|
		a << str.chomp!.to_i
#		p str
	}
}
#p a

# algorithm 1
=begin
for i in 0...a.length - 1
	j = i
	while a[j] > a[j + 1]
		tmp = a[j]
		a[j] = a[j + 1]
		a[j + 1] = tmp
		cross += 1
		j -= 1
		if j < 0 then
			break
		end
	end
p i
#p a
#p cross
end
=end

#a = [3, 1, 4, 10, 5, 9, 2, 6, 8, 7]
#p a


# algorithm 2
=begin
for i in 1...a.length
	idx = a.index(i)
	a.delete(i)
	a.insert(i - 1, i)
	cross += idx - i + 1
	if i % 10000 == 0 then
		p i
	end
#p a
end
#start:Wed Aug 21 11:10:01 +0900 2013
#end  :Wed Aug 21 15:08:07 +0900 2013
#cross:24689222839
=end


# algorithm 3
#a = [3, 1, 4, 10, 5, 9, 2, 6, 8, 7]
#p a
b = []
c = []
b << a[0]
for i in 1..a.length-1
#p i
	while a[i] < b.last
		c << b.pop
		cross += 1
		if b.length == 0 then
			break
		end
	end
	b << a[i]
	while c.length > 0
		b << c.pop
	end
	if i % 10000 == 0 then
		p i
	end
#print "cross:", cross, "\n"
end
#start:Wed Aug 21 15:47:41 +0900 2013
#end  :Thu Aug 22 07:34:33 +0900 2013
#cross:24689222839

=begin
for i in 1..a.length
	idx = a.index(i)
	if i % 10000 == 0 then
		p i
	end
end
=end

=begin
for i in 1...a.length
	a.delete(i)
	a.insert(i - 1, i)
	if i % 10000 == 0 then
		p i
	end
end
=end


print "cross:", cross, "\n"

p Time.now
