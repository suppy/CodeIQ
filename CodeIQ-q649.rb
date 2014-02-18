# Fibo{B}
#   a[0]=1,
#   a[1]=B,
#   a[i]=a[i-1]+a[i-2] if 2<=i
def Fibo(b, i)
	if i == 0
		return 1;
	elsif i == 1
		return b;
	else
		return Fibo(b, i-1) + Fibo(b, i-2)
	end
end

# Fibo{b}の数列で、n以下の数を配列に格納し、返す
def SFibo(b, n)
	arr = []
	i = 0
	loop do
		arr << Fibo(b, i)
		if  arr[-1] >= n
			break;
		end
		i = i + 1
	end
	return arr
end

# nの約フィボナッチ数を配列に格納し、返す
def YFibo(n)
	arr = []
	for j in (1..n) do
		sfibo = SFibo(j, n)
		if sfibo[-1] == n
			arr << sfibo
		end
	end
	arr.flatten.uniq.sort
end

# x と y の最大公約フィボナッチ数を返す
def GCFibo(x, y)
	((YFibo(x) & YFibo(y)).uniq.sort)[-1]
end

# 最大公約フィボナッチ数
p GCFibo( 23, 25 )
p GCFibo( 308, 320 )
p GCFibo( 6168, 9877 )
p GCFibo( 18518, 19942 )