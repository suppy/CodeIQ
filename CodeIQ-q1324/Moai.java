//���A�C���N���X
public class Moai extends AbstractSnowDoll {
    
    final String SNOW_DOLL_NAME = "���A�C��";
    public Moai(String tripletsName,String friendName,int snowDollCount) {
        this.settripletsName(tripletsName);
        this.setfriendName(friendName);
        this.setsnowDollCount(snowDollCount);
    }
    
    public Moai(String tripletsName,String friendName) {
        this.settripletsName(tripletsName);
        this.setfriendName(friendName);
        this.setsnowDollCount(30);
    }
    @Override
    public void makeSnowDoll() {
        System.out.println(this.getSnowDollInfo(SNOW_DOLL_NAME));
    }
}