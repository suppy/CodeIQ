//�G�r�s���t�N���X
public class EbiPilaf extends BuildRecipe {
    
    private String strEggRecipe;
    private String strShrimpRecipe;
    private String strRiceRecipe;
    @Override
    public void cookEgg(String strEgg) {
        this.strEggRecipe = strEgg + "�͂�ŗ��ɂ��Ă����܂��B";
    }
    @Override
    public void cookShrimp(String strShrimp) {
        this.strShrimpRecipe = strShrimp + "�͈����ɐ؂��Ă����܂��B";
    }
    @Override
    public void cookRice(String strRice) {
        this.strRiceRecipe = strRice + "�͐���Ă����܂��B";
    }
    @Override
    String doCooking() {
        String strCooking = "";
        strCooking += "�G�r�s���t�̍����ł��B";
        strCooking += "\n";
        strCooking += this.strEggRecipe;
        strCooking += "\n";
        strCooking += this.strShrimpRecipe;
        strCooking += "\n";
        strCooking += this.strRiceRecipe;
        strCooking += "\n";
        strCooking += "���Ăƃo�^�[�ƃG�r�����Ă����āA��ŗ����悹�Ăł�������I�I";
        strCooking += "\n";
        return strCooking;
    }
}