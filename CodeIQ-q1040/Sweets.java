//お菓子の種類を定義する
public enum Sweets {
    //ビスケット
    BISCUIT("ビスケット"),
    //チョコレート
    CHOCOLATE("チョコレート"),
    //キャンディー
    CANDY("キャンディー");
    private String name;
    private Sweets(String name){
        this.name= name;
    }
    public String toString(){
        return this.name;
    }
}