class Customer {
    public String name = "";                // �ڋq��
    public int loan = 0;                    // �Z���z
    public int amount = 0;                    // �ԍϗ\��z(�Z���z+���q)
    // �Z�����s
    public void doLoan( String name, int money ) {
        // �ڋq���Z�b�g
        this.name = name;
        // �Z���z�Z�b�g
        this.loan = money;
        // �ԍϗ\��z�Z�b�g
        this.amount = money + (int)Math.ceil( money * Const.LOAN_RATE );
    }
}