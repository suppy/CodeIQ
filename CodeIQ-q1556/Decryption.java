public class Decryption {
    // 暗号解読呼び出し
    public static String convert(String target) {
        target = convertOne(target);
        target = convertTwo(target);
        return target;
    }
    // 暗号1
    public static String convertOne(String target) {
        return target.replaceAll("な[さ-そ]|[学級に]", "");
    }
    // 暗号2
    public static String convertTwo(String target) {
        StringBuilder sb = new StringBuilder();
        String oneChar;
        for (int i = 0; i < target.length(); i++) {
            oneChar = target.substring(i, i + 1);
            if (oneChar.matches("[ぁ-ん]") || i % 2 != 0) {
                sb.append(oneChar);
            }
        }
        return sb.reverse().toString();
    }
}