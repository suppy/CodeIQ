//�Ⴞ��܃N���X
public class YukiDaruma extends AbstractSnowDoll {
    
    final String SNOW_DOLL_NAME = "�Ⴞ���";
    public YukiDaruma(String tripletsName,String friendName,int snowDollCount){
        this.settripletsName(tripletsName);
        this.setfriendName(friendName);
        this.setsnowDollCount(snowDollCount);
    }
    
    public YukiDaruma(String tripletsName,String friendName){
        this.settripletsName(tripletsName);
        this.setfriendName(friendName);
        this.setsnowDollCount(20);
    }
    
    @Override
    public void makeSnowDoll() {
        System.out.println(this.getSnowDollInfo(SNOW_DOLL_NAME));
    }
}