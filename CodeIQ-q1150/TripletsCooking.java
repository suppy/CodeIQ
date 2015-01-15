//三つ子調理クラス
public class TripletsCooking {
    public static void main(String[] args) {
        Mama mama = new Mama();
        BuildRecipe BeckyCook = new TemakiSushi();
        BuildRecipe CathyCook = new EbiChahang();
        BuildRecipe MichelCook = new EbiPilaf();
        
        mama.setBuildRecipe(BeckyCook);
        mama.Material();
        System.out.println("ベッキーが挑戦する" + BeckyCook.doCooking());
        
        mama.setBuildRecipe(CathyCook);
        mama.Material();
        System.out.println("キャシーが挑戦する" + CathyCook.doCooking());
        
        mama.setBuildRecipe(MichelCook);
        mama.Material();
        System.out.println("ミシェルが挑戦する" + MichelCook.doCooking());
    }
}