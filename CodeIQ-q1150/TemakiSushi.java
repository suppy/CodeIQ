//�芪�����i�N���X
public class TemakiSushi extends BuildRecipe {
    
    private String strEggRecipe;
    private String strShrimpRecipe;
    private String strRiceRecipe;
    @Override
    public void cookEgg(String strEgg) {
        this.strEggRecipe = strEgg + "�͋ю����ɂ��܂��B";
    }
    @Override
    public void cookShrimp(String strShrimp) {
        this.strShrimpRecipe = strShrimp + "�͉���łɂ��܂��B";
    }
    @Override
    public void cookRice(String strRice) {
        this.strRiceRecipe = strRice + "�͐����Đ|�тɂ��܂��B";
    }
    @Override
    String doCooking() {
        String strCooking = "";
        strCooking += "�芪�����i�̍����ł��B";
        strCooking += "\n";
        strCooking += this.strEggRecipe;
        strCooking += "\n";
        strCooking += this.strShrimpRecipe;
        strCooking += "\n";
        strCooking += this.strRiceRecipe;
        strCooking += "\n";
        strCooking += "�̂�ɐ|�т�~���A�ю����ƃG�r���悹�Ċ����Ăł�������I�I";
        strCooking += "\n";
        return strCooking;
    }
}