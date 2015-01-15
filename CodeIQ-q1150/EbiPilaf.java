//エビピラフクラス
public class EbiPilaf extends BuildRecipe {
    
    private String strEggRecipe;
    private String strShrimpRecipe;
    private String strRiceRecipe;
    @Override
    public void cookEgg(String strEgg) {
        this.strEggRecipe = strEgg + "はゆで卵にしておきます。";
    }
    @Override
    public void cookShrimp(String strShrimp) {
        this.strShrimpRecipe = strShrimp + "は一口大に切っておきます。";
    }
    @Override
    public void cookRice(String strRice) {
        this.strRiceRecipe = strRice + "は洗っておきます。";
    }
    @Override
    String doCooking() {
        String strCooking = "";
        strCooking += "エビピラフの作り方です。";
        strCooking += "\n";
        strCooking += this.strEggRecipe;
        strCooking += "\n";
        strCooking += this.strShrimpRecipe;
        strCooking += "\n";
        strCooking += this.strRiceRecipe;
        strCooking += "\n";
        strCooking += "お米とバターとエビを入れてたいて、ゆで卵を乗せてできあがり！！";
        strCooking += "\n";
        return strCooking;
    }
}