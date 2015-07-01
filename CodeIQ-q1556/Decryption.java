public class Decryption {
    // ˆÃ†‰ğ“ÇŒÄ‚Ño‚µ
    public static String convert(String target) {
        target = convertOne(target);
        target = convertTwo(target);
        return target;
    }
    // ˆÃ†1
    public static String convertOne(String target) {
        return target.replaceAll("‚È[‚³-‚»]|[Šw‹‰‚É]", "");
    }
    // ˆÃ†2
    public static String convertTwo(String target) {
        StringBuilder sb = new StringBuilder();
        String oneChar;
        for (int i = 0; i < target.length(); i++) {
            oneChar = target.substring(i, i + 1);
            if (oneChar.matches("[‚Ÿ-‚ñ]") || i % 2 != 0) {
                sb.append(oneChar);
            }
        }
        return sb.reverse().toString();
    }
}