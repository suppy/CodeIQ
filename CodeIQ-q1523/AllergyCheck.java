import java.util.HashMap;
import java.util.Map;
public abstract class AllergyCheck {
    protected String name;
    protected HashMap<String,AllergyCheckResult> checkResult = new HashMap<String,AllergyCheckResult>();
    public AllergyCheck(String name){
        this.name = name;
    }
    public void getCheckResult(){
        System.out.println(this.name + "�̌������ʊJ�n");
        for(Map.Entry<String, AllergyCheckResult> e :checkResult.entrySet()){
            if(e.getValue().equals(AllergyCheckResult.INSEI)){
                System.out.println(e.getKey() + "�ŉԕ��ǂɂȂ�܂���B");
            }else{
                System.out.println(e.getKey() + "�ŉԕ��ǂɂȂ�܂��B");
            }
        }
        System.out.println(this.name + "�̌������ʏI��");
        System.out.println("");
    }
    abstract public void setCheckResult();
}