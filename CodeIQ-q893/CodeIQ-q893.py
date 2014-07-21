# CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
# コード銀行：「7」の数を数えよう
# https://codeiq.jp/ace/code_teller/q893

n = 99
n = 77777
# n = 23678947 # Time limit exceeded
num = 0
for i in range(1, n + 1):
	num += str(i).count("7")
print num