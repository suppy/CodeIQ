//お菓子を分け与えるママのクラス
import java.util.HashMap;
import java.util.Map;
public class Mama extends SweetsMediator {
    Map<String,Sisters>Sisters = new HashMap<String,Sisters>();
    final int divideCount = 3;
    public Mama(int intChoco) {
        super(intChoco);
    }
    @Override
    public void addSisters(Sisters sisters) {
        Sisters.put(sisters.getName(), sisters);
    }
    @Override
    public int divideSweets(Sisters sisters, String sweets) {
        if("チョコレート".equals(sisters.getFavorite())){
            return this.intChocalateCount/divideCount;
        } else {
            return this.intChocalateCount%divideCount;
        }
    }
}