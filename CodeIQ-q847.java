/* package whatever; // don't place package name! */

import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be "Main" only if the class is public. */
class Ideone
{
	public static void main (String[] args) throws java.lang.Exception
	{
		String[] str = {"0", "1", "2", "3", "4", "5"}; 
		String[] str2;

	for(int i = 12345;i <= 12347;i++) {
//			if (Arrays.equals(Arrays.sort(Integer.toString(i).split("")), str)) {
			str2 = Integer.toString(i).substring(0,Integer.toString(i).length()).split("");
			System.out.println(Arrays.toString(str2));
			if (Arrays.equals(str2, str)) {
				System.out.println(i);
			}
		}

		System.out.println(Arrays.toString("12345".split("")));
		System.out.println(Integer.toString(123456));
		System.out.println(Integer.toString(123456).split("")[1]);
		System.out.println(Integer.toString(123456).split("")[2]);
		System.out.println(Integer.toString(123456).split("")[3]);
		System.out.println(Integer.toString(123456).split("")[4]);
		System.out.println(Integer.toString(123456).split("")[5]);
		System.out.println(Integer.toString(123456).split("")[6]);

	}
}