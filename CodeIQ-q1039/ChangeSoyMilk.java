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
