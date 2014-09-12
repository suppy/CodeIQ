//お菓子を分け与える人の抽象クラス
public abstract class SweetsMediator {
    //チョコレートの数
    protected int intChocalateCount;
    //コンストラクタ
    public SweetsMediator(int intChoco){
        this.intChocalateCount = intChoco;
    }
    //姉妹を加える
    public abstract void addSisters(Sisters sisters);
    //お菓子を分け与える
    public abstract int divideSweets(Sisters sisters,String sweets);
}
