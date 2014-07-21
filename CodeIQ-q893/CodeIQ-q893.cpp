// CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
// コード銀行：「7」の数を数えよう
// https://codeiq.jp/ace/code_teller/q893
// C++11(gcc-4.8.1)

#include <iostream>
#include <string>
using namespace std;

int main() {
	int n;
	n = 99;
	n = 77777;
	int num = 0;
	std::string str;
	for(int i = 1;i <= n;i++) {
		str = std::to_string(i); // C++11標準ライブラリに新しく追加された std::to_string 関数
		for(int j = 0;j < str.length();j++){
			if(str.at(j) == '7'){
				num++;
			}
		}
	}
	cout << num << "\n";

	return 0;
}