# コード銀行：階段ピョンピョン１２３！

# 段数 n のときの上がり方の数
#  n-1段から 1段を一歩で上がる
#  n-2段から 2段を一歩で上がる
#  n-3段から 3段を一歩で上がる
#  上記3パターンの和
#
# Step(n) = Step(n-1) + Step(n-2) + Step(n-3)

def Step(n)
	if n == 3
		return 4
	elsif n == 2
		return 2
	elsif n == 1
		return 1
	elsif n == 0
		return 0
	elsif n < 0
		return 0
	end
	Step(n-1) + Step(n-2) + Step(n-3)
end

p Step(30) # => 53798080
