//メインクラス
public class TripletsCoffee {
    public static void main(String[] args) {
        Coffee beckyCoffee = new WithCream(new FoxLatte());
        Coffee cathyCoffee = new ChangeSoyMilk(new FoxCaramel());
        Coffee michelCoffee = new ChangeSoyMilk(new WithCream(new WithVanillaSyrup(new FoxMocha())));
        System.out.println("ベッキーは" + beckyCoffee.getItemName() + "を注文しました。");
        System.out.println("キャシーは" + cathyCoffee.getItemName() + "を注文しました。");
        System.out.println("ミシェルは" + michelCoffee.getItemName() + "を注文しました。");
    }
}