//雪遊びクラス
public class TripletsSnowPlay {
    public static void main(String[] args) {
        YukiDaruma yukiDaruma = new YukiDaruma("ミシェル","エミリー",10);
        YukidarimaOnHat yukiDarumaOnHat = new YukidarimaOnHat("ベッキー","キャメロン");
        Moai moai = new Moai("キャシー","アンジェリカ");
        
        yukiDaruma.makeSnowDoll();
        yukiDarumaOnHat.makeSnowDoll();
        moai.makeSnowDoll();
    }
}