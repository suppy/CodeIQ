public class TreasureHunting {
    // 宝探しゲーム
    public static void main(String[] args) {
        // ここに宝を埋めている。
        String place = "上下の木材なき大学も最小級の裏庭に登校なし";
        // 埋めた場所を解読せよ。
        System.out.println(Decryption.convert(place));
    }
}