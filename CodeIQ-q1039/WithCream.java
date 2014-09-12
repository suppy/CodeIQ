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
