// メインクラス
public class Ten_Tame {
    public static void main( String[] args ) {
        Customer cust = new Customer();            // 顧客
        cust.doLoan( "金無弘美", 1000000 );        // 融資実行
        System.out.println( "利率：" + ( Const.LOAN_RATE * 100 ) + "%" );
        System.out.println( cust.name + "はんに" + cust.loan + "円融資しまっせ?" );
        System.out.println( "返済は利子付けて" + cust.amount + "円になりまっせ。" );
    }
}
