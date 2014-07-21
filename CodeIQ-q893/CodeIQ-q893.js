// CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
// コード銀行：「7」の数を数えよう
// https://codeiq.jp/ace/code_teller/q893

n = 99;
s = "";
num = 0;
for(i = 1;i <= n;i++) {
	s += i;
}
print(s);
for(i = 0;i < s.length;i++) {
	if(s[i] == "7") {
		num++;
	}
}
print(num);