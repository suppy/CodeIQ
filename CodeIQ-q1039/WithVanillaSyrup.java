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
