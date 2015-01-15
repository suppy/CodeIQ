import java.math.BigDecimal;
// メインクラス
public class Ten_Tame {
    // 顧客毎の残高一覧
    public static BigDecimal amount[] = { 
        new BigDecimal( "0.00" ),                        // 顧客No.0
        new BigDecimal( "1527.25" ),                     // 顧客No.1
        new BigDecimal( "574485912.58" ),                // 顧客No.2
        new BigDecimal( "0.00" ),                        // 顧客No.3
        new BigDecimal( "65487.14" ),                    // 顧客No.4
        new BigDecimal( "1.00" ),                        // 顧客No.5
        new BigDecimal( "0.00" )                         // 顧客No.6
    };
    // メイン関数
    public static void main( String[] args ) throws InterruptedException {
        BigDecimal balance = new BigDecimal( "0.00" );        // 検索したい残高額
        System.out.println( "ヤスコ　　　(残高0円の顧客数):" + officeLady( balance ) );
        System.out.println( "基幹システム(残高0円の顧客数):" + mainFrame( balance ) );
    }
    // 銀行員関数
    public static int officeLady( BigDecimal balance ) {
        // 現在残高に利息額を加算する
        /* 残高0円の利息なんて0円なんだから計算省略してもいいよね */
        // 検索対象の残高額の顧客数を集計
        int count = 0;
        for( int i = 0; i < amount.length; i++ ) {
            if( amount[ i ].equals( balance ) ) {
                count++;
            }
        }
        return count;
    }
    // 基幹システム関数
    public static int mainFrame( BigDecimal balance ) {
        // 現在残高に利息額を加算する
        BigDecimal interest = new BigDecimal( "1.0031" );     // 利率0.31%
        for( int i = 0; i < amount.length; i++ ) {
            amount[ i ] = amount[ i ].multiply( interest );    // 利息を残高に加算
        }
        // 検索対象の残高額の顧客数を集計
        int count = 0;
        for( int i = 0; i < amount.length; i++ ) {
//            if( amount[ i ].equals( balance ) ) {
            if( amount[ i ].compareTo( balance ) == 0 ) {
                count++;
            }
        }
        return count;
    }
}