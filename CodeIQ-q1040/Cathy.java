//キャシーのクラス
public class Cathy extends Sisters {
    public Cathy(String name, String favorite) {
        super(name, favorite);
    }
    @Override
    public int getChocolate() {
        return sweetsMediator.divideSweets(this, Sweets.CHOCOLATE.toString());
    }
}