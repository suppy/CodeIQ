import java.util.HashMap;
import java.util.Map;
public abstract class AllergyCheck {
    protected String name;
    protected HashMap<String,AllergyCheckResult> checkResult = new HashMap<String,AllergyCheckResult>();
    public AllergyCheck(String name){
        this.name = name;
    }
    public void getCheckResult(){
        System.out.println(this.name + "の検査結果開始");
        for(Map.Entry<String, AllergyCheckResult> e :checkResult.entrySet()){
            if(e.getValue().equals(AllergyCheckResult.INSEI)){
                System.out.println(e.getKey() + "で花粉症になりません。");
            }else{
                System.out.println(e.getKey() + "で花粉症になります。");
            }
        }
        System.out.println(this.name + "の検査結果終了");
        System.out.println("");
    }
    abstract public void setCheckResult();
}