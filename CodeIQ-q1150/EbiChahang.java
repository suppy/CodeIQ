//�G�r�`���[�n���N���X
public class EbiChahang extends BuildRecipe {
    
    private String strEggRecipe;
    private String strShrimpRecipe;
    private String strRiceRecipe;
    @Override
    public void cookEgg(String strEgg) {
        this.strEggRecipe = strEgg + "�͗n���Ă����܂��B";
    }
    @Override
    public void cookShrimp(String strShrimp) {
        this.strShrimpRecipe = strShrimp + "�͑f�g�����Ă����܂��B";
    }
    @Override
    public void cookRice(String strRice) {
        this.strRiceRecipe = strRice + "�͐����ėn�������ɂ���߂܂��B";
    }
    @Override
    String doCooking() {
        String strCooking = "";
        strCooking += "�G�r�`���[�n���̍����ł��B";
        strCooking += "\n";
        strCooking += this.strEggRecipe;
        strCooking += "\n";
        strCooking += this.strShrimpRecipe;
        strCooking += "\n";
        strCooking += this.strRiceRecipe;
        strCooking += "\n";
        strCooking += "���͂���u�߂đf�g�������G�r���悹�Ăł�������I�I";
        strCooking += "\n";
        return strCooking;
    }
}