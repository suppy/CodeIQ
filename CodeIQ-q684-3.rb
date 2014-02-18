def fact (n)
	(n-1).downto(1) do |i|
		n *= i
	end
	return n
end


num = 0

# 以下のプログラムでは、宝石を 16個並べる組み合わせ数を足し合わせているだけ
# 16個未満の宝石パターンを考慮しないといけない

fact15 = fact(15)
num += fact15 / fact(4) / fact(4) / fact(2) / fact(3) # a*
num += fact15 / fact(3) / fact(4) / fact(2) / fact(3) # b*
num += fact15 / fact(4) / fact(4) / fact(2) / fact(3) # c*
num += fact15 / fact(4) / fact(3) / fact(2) / fact(3) # d*

num += 2 # e, ea

fact13 = fact(13)
num += fact13 / fact(3) / fact(4) / fact(3) # eab*
num += fact13 / fact(4) / fact(4) / fact(3) # eac*
num += fact13 / fact(4) / fact(3) / fact(3) # ead*
num += fact13 / fact(4) / fact(4) / fact(3) # eae*
num += fact13 / fact(4) / fact(4) / fact(3) # eaf*

num += 1 # eag

fact12 = fact(12)
num += fact12 / fact(3) / fact(4) / fact(2) # eagb*

num += 1 # eagc

fact11 = fact(11)
num += fact11 / fact(3) / fact(4) / fact(2) # eacgb*

num += 1 # eacgd

fact10 = fact(10)
num += fact10 / fact(3) / fact(3) / fact(2) # eacgdb*
num += fact10 / fact(4) / fact(2) / fact(2) # eacgdd*
num += fact10 / fact(4) / fact(3) / fact(2) # eacgde*

num += 2 # eagcdf, eagcdfb

fact8 = fact(8)
num += fact8 / fact(2) / fact(3) / fact(2) # eagcdfbb*
num += fact8 / fact(3) / fact(2) / fact(2) # eagcdfbd*

num += 1 # eagcdfbe

p num # => 1913615768
p "This is a wrong answer."
 

