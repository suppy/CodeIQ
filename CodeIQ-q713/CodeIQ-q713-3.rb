# コード銀行：階段ピョンピョン１２３！

# 段数 n のときの上がり方の数
#  n-1段から 1段を一歩で上がる
#  n-2段から 2段を一歩で上がる
#  n-3段から 3段を一歩で上がる
#  上記3パターンの和
#
# Step(n) = Step(n-1) + Step(n-2) + Step(n-3)

def Step(n)
	step = [ 0, 1, 2, 4 ]

	if n <= 3
		return step[n]
	end

	for i in (4..n)
		step[i] = step[i-1] + step[i-2] + step[i-3]
#		p step[i]
	end

	return step[n]
end

p Step(30) # => 53798080
