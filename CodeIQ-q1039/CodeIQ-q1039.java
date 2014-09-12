//インタフェース
public interface Coffee {
    //商品名を取得する
    public String getItemName();
}
//フォックス・ラテクラス
public class FoxLatte implements Coffee {
    @Override
    public String getItemName() {
        return "フォックス・ラテ";
    }
}
//フォックス・キャラメルクラス
public class FoxCaramel implements Coffee {
    @Override
    public String getItemName() {
        return "フォックス・キャラメル";
    }
}
//フォックス・モカクラス
public class FoxMocha implements Coffee {
    @Override
    public String getItemName() {
        return "フォックス・モカ";
    }
}
//ホイップクリームトッピングクラス
public class WithCream implements Coffee {
    private Coffee coffee = null;
    public WithCream(Coffee coffee){
        this.coffee = coffee;
    }
    @Override
    public String getItemName() {
        return coffee.getItemName().concat(" プラス ホイップクリームトッピング");
    }
}
//豆乳変更クラス
public class ChangeSoyMilk implements Coffee {
    private Coffee coffee = null;
    public ChangeSoyMilk(Coffee coffee){
        this.coffee = coffee;
    }
    @Override
    public String getItemName() {
        return coffee.getItemName().concat("の牛乳を豆乳に変更");
    }
}
//バニラシロップトッピングクラス
public class WithVanillaSyrup implements Coffee {
    private Coffee coffee = null;
    public WithVanillaSyrup(Coffee coffee){
        this.coffee = coffee;
    }
    @Override
    public String getItemName() {
        return coffee.getItemName().concat(" プラス バニラシロップトッピング");
    }
}
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