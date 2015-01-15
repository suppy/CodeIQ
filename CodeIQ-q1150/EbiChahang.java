//エビチャーハンクラス
public class EbiChahang extends BuildRecipe {
    
    private String strEggRecipe;
    private String strShrimpRecipe;
    private String strRiceRecipe;
    @Override
    public void cookEgg(String strEgg) {
        this.strEggRecipe = strEgg + "は溶いておきます。";
    }
    @Override
    public void cookShrimp(String strShrimp) {
        this.strShrimpRecipe = strShrimp + "は素揚げしておきます。";
    }
    @Override
    public void cookRice(String strRice) {
        this.strRiceRecipe = strRice + "は炊いて溶いた卵にからめます。";
    }
    @Override
    String doCooking() {
        String strCooking = "";
        strCooking += "エビチャーハンの作り方です。";
        strCooking += "\n";
        strCooking += this.strEggRecipe;
        strCooking += "\n";
        strCooking += this.strShrimpRecipe;
        strCooking += "\n";
        strCooking += this.strRiceRecipe;
        strCooking += "\n";
        strCooking += "ごはんを炒めて素揚げしたエビを乗せてできあがり！！";
        strCooking += "\n";
        return strCooking;
    }
}