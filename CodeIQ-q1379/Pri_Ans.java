// ���C���N���X
public class Pri_Ans {
    // ���C���֐�
    public static void main( String args[] ) {
        // ���X�̑ݕt�Ɩ�
        Keiyaku( 0, 250000, "�R�c�V�l" );
        Keiyaku( 1, 120000, "�K�L����" );
        // �����ݒ�m�F(�K�T����)
        interestRateDisplay();
    }
    // �ݕt���s�����֐�
    public static void Keiyaku( int product, int loanAmount, String name ) {
        Config conf = new Config();
        int[] interestRates = conf.getInterestRates();        // �����l�擾
        /////// �閧�̃R�[�h /////////////////////////
        interestRates[ product ] += 70;                    // 70%����悹���Ă�̓��������
        //////////////////////////////////////////////
        System.out.println( name + "�l�ɑݕt���s" );
        System.out.println( "�ݕt�z�F" + loanAmount + "�~" );
        System.out.println( "�����F" + interestRates[ product ] + "%" );
        System.out.println( "" );
    }
    // ���i���̗����ݒ�m�F��ʕ\���֐�
    public static void interestRateDisplay() {
        Config conf = new Config();
        int[] interestRates = conf.getInterestRates();
        System.out.println( "���݂̗����ݒ�󋵈ꗗ" );
        System.out.println( "���i1�̗����F" + interestRates[ 0 ] + "%" );
        System.out.println( "���i2�̗����F" + interestRates[ 1 ] + "%" );
    }
}