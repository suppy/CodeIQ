public class MatthewComing {
    public static void main(String[] args) {
        final String present = "人生ゲーム";
        HouseSitting becky = new Becky("ベッキー");
        HouseSitting cathy = new Cathy("キャシー");
        HouseSitting michel = new Michel("ミシェル");
        becky.setPresent();
        cathy.setPresent();
        michel.setPresent();
        becky.comeSomeone(present);
        cathy.comeSomeone(present);
        michel.comeSomeone(present);
    }
}