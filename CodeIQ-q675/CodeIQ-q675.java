/* package whatever; // don't place package name! */

import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be "Main" only if the class is public. */
class Ideone
{
	public static void main (String[] args) throws java.lang.Exception
	{
		// 指定した数までの素数の数を求める
		int num = 977;
		
		// 素数を格納するコレクション
		ArrayList<Integer> primeNumberList = new ArrayList<Integer>();
		
		for(int i = 2;i < num; i++){
			boolean prime = true;
			for(int j = 2;j < i;j++){
				if(i % j == 0){
					prime = false;
					break;
				}
			}
			if(prime){
				primeNumberList.add(i);
			}
		}
		System.out.println(primeNumberList.size());
			
		
	}
}