import java.math.BigDecimal;
// ���C���N���X
public class Ten_Tame {
    // �ڋq���̎c���ꗗ
    public static BigDecimal amount[] = { 
        new BigDecimal( "0.00" ),                        // �ڋqNo.0
        new BigDecimal( "1527.25" ),                     // �ڋqNo.1
        new BigDecimal( "574485912.58" ),                // �ڋqNo.2
        new BigDecimal( "0.00" ),                        // �ڋqNo.3
        new BigDecimal( "65487.14" ),                    // �ڋqNo.4
        new BigDecimal( "1.00" ),                        // �ڋqNo.5
        new BigDecimal( "0.00" )                         // �ڋqNo.6
    };
    // ���C���֐�
    public static void main( String[] args ) throws InterruptedException {
        BigDecimal balance = new BigDecimal( "0.00" );        // �����������c���z
        System.out.println( "���X�R�@�@�@(�c��0�~�̌ڋq��):" + officeLady( balance ) );
        System.out.println( "��V�X�e��(�c��0�~�̌ڋq��):" + mainFrame( balance ) );
    }
    // ��s���֐�
    public static int officeLady( BigDecimal balance ) {
        // ���ݎc���ɗ����z�����Z����
        /* �c��0�~�̗����Ȃ��0�~�Ȃ񂾂���v�Z�ȗ����Ă�������� */
        // �����Ώۂ̎c���z�̌ڋq�����W�v
        int count = 0;
        for( int i = 0; i < amount.length; i++ ) {
            if( amount[ i ].equals( balance ) ) {
                count++;
            }
        }
        return count;
    }
    // ��V�X�e���֐�
    public static int mainFrame( BigDecimal balance ) {
        // ���ݎc���ɗ����z�����Z����
        BigDecimal interest = new BigDecimal( "1.0031" );     // ����0.31%
        for( int i = 0; i < amount.length; i++ ) {
            amount[ i ] = amount[ i ].multiply( interest );    // �������c���ɉ��Z
        }
        // �����Ώۂ̎c���z�̌ڋq�����W�v
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