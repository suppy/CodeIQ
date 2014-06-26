import java.io.*;
import java.util.*;
import java.text.*;

class CodeIQ_q832 {
	public static void main(String args[]){

		// 入力ファイル名はコマンドライン引数で入力
		String fileName = args[0];
		
		// サイズを表す文字
		String[] sizeChar = {"S", "M", "L"};
//		System.out.println(sizeChar[0]);

		// サイズの境界値
		int[] sizeBorder = {50, 75};
//		System.out.println(sizeBorder[0]);
		
		String  fishName;
		int fishSize;
		
		// マップ　キー：サイズの文字，データ：匹数
		Map<String, Integer> fishNumMap = new HashMap<String, Integer>();
		// 初期化
		for(String size: sizeChar) {
			fishNumMap.put(size, 0);
		}

		// マップ　キー：サイズの文字，データ：大きさの総和
		Map<String, Integer> fishSizeSumMap = new HashMap<String, Integer>();
		// 初期化
		for(String size: sizeChar) {
			fishSizeSumMap.put(size, 0);
		}

		try {
			FileReader fr = new FileReader(fileName);
			BufferedReader br = new BufferedReader(fr);
			
			String line;
			StringTokenizer token;
			
			while ((line = br.readLine()) != null) {
				token = new StringTokenizer(line, ",");
				
				while (token.hasMoreTokens()) {
					fishName = token.nextToken();
					fishSize = Integer.valueOf(token.nextToken());
					if (fishName.equals("カツオ")) {
						// サイズで分類する
						int i;
						for(i = 0;i < sizeBorder.length;i++) {
							if (fishSize < sizeBorder[i]) {
								break;
								
							}							
						}
						// 数をインクリメント
						fishNumMap.put(sizeChar[i], fishNumMap.get(sizeChar[i]) + 1);
						// 大きさを加算
						fishSizeSumMap.put(sizeChar[i], fishSizeSumMap.get(sizeChar[i]) + fishSize);
					}
				}
			}
			
			br.close();
		
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		
		DecimalFormat df = new DecimalFormat("0.00");
		// サイズごとに、匹数と大きさの平均値を表示
		for(String size: sizeChar) {
//			System.out.println(size);
			System.out.println(size + "(" + fishNumMap.get(size) + "): " + df.format((double)fishSizeSumMap.get(size) / fishNumMap.get(size)) + "cm");
		}
	}
}
