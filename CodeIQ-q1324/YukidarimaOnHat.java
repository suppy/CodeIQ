//�X�q���̐Ⴞ��܃N���X
public class YukidarimaOnHat extends YukiDaruma {
    
    final String SNOW_DOLL_NAME = "�X�q���̐Ⴞ���";
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