import java.io.*;
import java.util.*;
import java.text.*;

class CodeIQ_q832 {
	public static void main(String args[]){

		// ���̓t�@�C�����̓R�}���h���C�������œ���
		String fileName = args[0];
		
		// �T�C�Y��\������
		String[] sizeChar = {"S", "M", "L"};
//		System.out.println(sizeChar[0]);

		// �T�C�Y�̋��E�l
		int[] sizeBorder = {50, 75};
//		System.out.println(sizeBorder[0]);
		
		String  fishName;
		int fishSize;
		
		// �}�b�v�@�L�[�F�T�C�Y�̕����C�f�[�^�F�C��
		Map<String, Integer> fishNumMap = new HashMap<String, Integer>();
		// ������
		for(String size: sizeChar) {
			fishNumMap.put(size, 0);
		}

		// �}�b�v�@�L�[�F�T�C�Y�̕����C�f�[�^�F�傫���̑��a
		Map<String, Integer> fishSizeSumMap = new HashMap<String, Integer>();
		// ������
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
					if (fishName.equals("�J�c�I")) {
						// �T�C�Y�ŕ��ނ���
						int i;
						for(i = 0;i < sizeBorder.length;i++) {
							if (fishSize < sizeBorder[i]) {
								break;
								
							}							
						}
						// �����C���N�������g
						fishNumMap.put(sizeChar[i], fishNumMap.get(sizeChar[i]) + 1);
						// �傫�������Z
						fishSizeSumMap.put(sizeChar[i], fishSizeSumMap.get(sizeChar[i]) + fishSize);
					}
				}
			}
			
			br.close();
		
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		
		DecimalFormat df = new DecimalFormat("0.00");
		// �T�C�Y���ƂɁA�C���Ƒ傫���̕��ϒl��\��
		for(String size: sizeChar) {
//			System.out.println(size);
			System.out.println(size + "(" + fishNumMap.get(size) + "): " + df.format((double)fishSizeSumMap.get(size) / fishNumMap.get(size)) + "cm");
		}
	}
}
