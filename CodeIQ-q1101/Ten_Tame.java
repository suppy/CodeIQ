// ƒƒCƒ“ƒNƒ‰ƒX
public class Ten_Tame {
    public static void main( String[] args ) {
        Customer cust = new Customer();            // ŒÚ‹q
        cust.doLoan( "‹à–³O”ü", 1000000 );        // —Z‘Às
        System.out.println( "—˜—¦F" + ( Const.LOAN_RATE * 100 ) + "%" );
        System.out.println( cust.name + "‚Í‚ñ‚É" + cust.loan + "‰~—Z‘‚µ‚Ü‚Á‚¹?" );
        System.out.println( "•ÔÏ‚Í—˜q•t‚¯‚Ä" + cust.amount + "‰~‚É‚È‚è‚Ü‚Á‚¹B" );
    }
}
