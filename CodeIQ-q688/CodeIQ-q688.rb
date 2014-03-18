# fruit: apple, strarberry, melon
# bracket: {}, (), []


data = "{apple strawberry (melon [ apple )}"

#data = "{melon (()melon strawberry)][apple}"
#data = "[apple apple }{melon](strawberry}(melon]]"
#data = "({}apple) melon strawberry{melon(apple apple) melon strawberry}"

#data = ")apple {apple }[strawberry}strawberry melon]}"
#data = "{apple [melon (strawberry](melon melon apple()}apple}"
#data = "[melon ]](apple strawberry {melon ]) apple (apple{"
#data = "(melon {apple strawberry strawberry)( apple [strawberry}}apple"
#data = "strawberry (apple {apple }}}strawberry melon){apple strawberry (melon)[}"

fruits = []
bracket = [ ["{", "}"],
			["(", ")"],
			["[", "]"] ]

# shorten the data
p data.gsub!(/apple/, "a")
p data.gsub!(/strawberry/, "s")
p data.gsub!(/melon/, "m")
p data.gsub!(/ /, "")


bracket.each do |b, e|
	print b,e,"\n"
	for i in 0...data.length
		subset = ""
		if data[i] == b
			for j in (i+1...data.length)
				if data[j] == b
#					subset = ""
					break
				end
				if data[j] == e
					fruits << subset
					break
				end
				if data[j] == "a" or data[j] == "s" or data[j] == "m"
					subset += data[j]
				end
			end
		end
	#	print data[i]
	end
	p fruits
end

num = []
fruits.each do | fruit |
	num << fruit.length
end

print "Number of fruit:", num.max()

