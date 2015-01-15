//手巻き寿司クラス
public class TemakiSushi extends BuildRecipe {
    
    private String strEggRecipe;
    private String strShrimpRecipe;
    private String strRiceRecipe;
    @Override
    public void cookEgg(String strEgg) {
        this.strEggRecipe = strEgg + "は錦糸卵にします。";
    }
    @Override
    public void cookShrimp(String strShrimp) {
        this.strShrimpRecipe = strShrimp + "は塩ゆでにします。";
    }
    @Override
    public void cookRice(String strRice) {
        this.strRiceRecipe = strRice + "は炊いて酢飯にします。";
    }
    @Override
    String doCooking() {
        String strCooking = "";
        strCooking += "手巻き寿司の作り方です。";
        strCooking += "\n";
        strCooking += this.strEggRecipe;
        strCooking += "\n";
        strCooking += this.strShrimpRecipe;
        strCooking += "\n";
        strCooking += this.strRiceRecipe;
        strCooking += "\n";
        strCooking += "のりに酢飯を敷き、錦糸卵とエビを乗せて巻いてできあがり！！";
        strCooking += "\n";
        return strCooking;
    }
}