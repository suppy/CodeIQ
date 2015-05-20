// メインクラス
public class Pri_Ans {
    // メイン関数
    public static void main( String args[] ) {
        // 日々の貸付業務
        Keiyaku( 0, 250000, "山田新人" );
        Keiyaku( 1, 120000, "銭有愛捨" );
        // 利率設定確認(ガサ入れ)
        interestRateDisplay();
    }
    // 貸付実行処理関数
    public static void Keiyaku( int product, int loanAmount, String name ) {
        Config conf = new Config();
        int[] interestRates = conf.getInterestRates();        // 利率値取得
        /////// 秘密のコード /////////////////////////
        interestRates[ product ] += 70;                    // 70%も上乗せしてるの内緒だよ♪
        //////////////////////////////////////////////
        System.out.println( name + "様に貸付実行" );
        System.out.println( "貸付額：" + loanAmount + "円" );
        System.out.println( "利率：" + interestRates[ product ] + "%" );
        System.out.println( "" );
    }
    // 商品毎の利率設定確認画面表示関数
    public static void interestRateDisplay() {
        Config conf = new Config();
        int[] interestRates = conf.getInterestRates();
        System.out.println( "現在の利率設定状況一覧" );
        System.out.println( "商品1の利率：" + interestRates[ 0 ] + "%" );
        System.out.println( "商品2の利率：" + interestRates[ 1 ] + "%" );
    }
}