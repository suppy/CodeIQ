class CarpStreamer{
    CarpStreamer(){
        System.out.println("矢車");
        System.out.println("吹き流し");
    }
    CarpStreamer(String... carp){
        this();
        System.out.println(carp);
    }
    CarpStreamer(String carp1,String... carp2){
        this();
        System.out.println(carp1);
        for(String val:carp2){
            System.out.println(val);
        }
    }
    CarpStreamer(String carp1,String carp2){
        this();
        System.out.println(carp1);
        System.out.println(carp2);
        System.out.println("子鯉");
    }
}
public class Pri_Ans{
    public static void main(String[] args){
        CarpStreamer cs = new CarpStreamer("真鯉","緋鯉");
    }
}