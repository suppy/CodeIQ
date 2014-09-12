//お菓子をもらう姉妹のクラス
public abstract class Sisters {
    protected SweetsMediator sweetsMediator;
    //姉妹の名前
    private String name;
    //姉妹の好み
    private String favorite;
    //コンストラクタ
    public Sisters(String name,String favorite){
        this.name = name;
        this.favorite = favorite;
    }
    //名前を取得する
    public String getName(){
        return name;
    }
    //好みを取得する
    public String getFavorite(){
        return favorite;
    }
    //お菓子をもらう人を設定する
    public void setSweetsMediator(SweetsMediator mediator){
        this.sweetsMediator = mediator;
    }
    //チョコレートをもらう
    public abstract int getChocolate();
}