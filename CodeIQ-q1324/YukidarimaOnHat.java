//帽子つきの雪だるまクラス
public class YukidarimaOnHat extends YukiDaruma {
    
    final String SNOW_DOLL_NAME = "帽子つきの雪だるま";
    public YukidarimaOnHat(String tripletsName, String friendName,int snowDollCount) {
        super(tripletsName, friendName, snowDollCount);
    }
    
    public YukidarimaOnHat(String tripletsName, String friendName) {
        super(tripletsName, friendName);
    }
    
    @Override
    public void makeSnowDoll() {
        System.out.println(this.getSnowDollInfo(SNOW_DOLL_NAME));
    }
}