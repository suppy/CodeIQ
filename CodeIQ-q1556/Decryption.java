public class Decryption {
    // �Í���ǌĂяo��
    public static String convert(String target) {
        target = convertOne(target);
        target = convertTwo(target);
        return target;
    }
    // �Í�1
    public static String convertOne(String target) {
        return target.replaceAll("��[��-��]|[�w����]", "");
    }
    // �Í�2
    public static String convertTwo(String target) {
        StringBuilder sb = new StringBuilder();
        String oneChar;
        for (int i = 0; i < target.length(); i++) {
            oneChar = target.substring(i, i + 1);
            if (oneChar.matches("[��-��]") || i % 2 != 0) {
                sb.append(oneChar);
            }
        }
        return sb.reverse().toString();
    }
}