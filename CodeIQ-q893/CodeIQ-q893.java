// CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
// コード銀行：「7」の数を数えよう
// https://codeiq.jp/ace/code_teller/q893

/* package whatever; // don't place package name! */

import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be "Main" only if the class is public. */
class Ideone
{
	public static void main (String[] args) throws java.lang.Exception
	{
		int i, j;
		int n;
		n = 99;
		n = 77777;
		//n = 23678947; // Time limit exceeded
		String s;
		int num = 0;
		for(i = 1;i <= n;i++) {
			s = "" + i;
			for(j = 0;j < s.length();j++) {
				if (s.charAt(j) == '7') {
					num++;
				}			
			}
		}
		System.out.println(num);
	}
}