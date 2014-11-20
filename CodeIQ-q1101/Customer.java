class Customer {
    public String name = "";                // ŒÚ‹q–¼
    public int loan = 0;                    // —Z‘Šz
    public int amount = 0;                    // •ÔÏ—\’èŠz(—Z‘Šz+—˜q)
    // —Z‘Às
    public void doLoan( String name, int money ) {
        // ŒÚ‹q–¼ƒZƒbƒg
        this.name = name;
        // —Z‘ŠzƒZƒbƒg
        this.loan = money;
        // •ÔÏ—\’èŠzƒZƒbƒg
        this.amount = money + (int)Math.ceil( money * Const.LOAN_RATE );
    }
}