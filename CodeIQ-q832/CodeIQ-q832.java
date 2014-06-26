import java.io.*;
import java.util.*;
import java.text.*;

class CodeIQ_q832 {
	public static void main(String args[]){
		
//		String fileName = "katsuo1000.csv";
		String fileName = args[0];
		String  fishName;
		int fishSize;
		int[] size = new int[3];
		Map<String, Integer> fishNumMap = new HashMap<String, Integer>(){{
			put("S", 0);
			put("M", 0);
			put("L", 0);
		}};
		Map<String, Integer> fishSizeSumMap = new HashMap<String, Integer>(){{
			put("S", 0);
			put("M", 0);
			put("L", 0);
		}};

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
					if (fishName.equals("ÉJÉcÉI")) {
						// System.out.println(fishName);
						// System.out.println(fishSize);
						if (fishSize < 50) {
							size[0]++;
							fishNumMap.put("S", fishNumMap.get("S") + 1);
							fishSizeSumMap.put("S", fishSizeSumMap.get("S") + fishSize);
						} else if (fishSize >= 50 && fishSize < 75) {
							size[1]++;
							fishNumMap.put("M", fishNumMap.get("M") + 1);
							fishSizeSumMap.put("M", fishSizeSumMap.get("M") + fishSize);
						} else {
							size[2]++;
							fishNumMap.put("L", fishNumMap.get("L") + 1);
							fishSizeSumMap.put("L", fishSizeSumMap.get("L") + fishSize);
						}
						
						
					}
				}
			}
			
			
			br.close();
		
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		

		DecimalFormat df = new DecimalFormat("0.00");
		System.out.println("S(" + fishNumMap.get("S") + "): " + df.format((double)fishSizeSumMap.get("S") / fishNumMap.get("S")) + "cm");
		System.out.println("M(" + fishNumMap.get("M") + "): " + df.format((double)fishSizeSumMap.get("M") / fishNumMap.get("M")) + "cm");
		System.out.println("L(" + fishNumMap.get("L") + "): " + df.format((double)fishSizeSumMap.get("L") / fishNumMap.get("L")) + "cm");

	}
}
