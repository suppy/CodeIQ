// ���C���N���X
public class Ten_Tame {
    public static void main( String[] args ) {
        Customer cust = new Customer();            // �ڋq
        cust.doLoan( "�����O��", 1000000 );        // �Z�����s
        System.out.println( "�����F" + ( Const.LOAN_RATE * 100 ) + "%" );
        System.out.println( cust.name + "�͂��" + cust.loan + "�~�Z�����܂���?" );
        System.out.println( "�ԍς͗��q�t����" + cust.amount + "�~�ɂȂ�܂����B" );
    }
}
