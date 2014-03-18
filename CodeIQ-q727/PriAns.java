import java.util.*;
class HinaDoll implements Comparable{
    String musicInst;
    int size;
    
    HinaDoll(String musicInst,int size){
        this.musicInst = musicInst;
        this.size = size;
    }
    
    public int compareTo(Object obj){
        return -(this.size - ((HinaDoll)obj).size);
    }
    
    void show(){
        System.out.print(musicInst + "�@");
    }
}
public class PriAns{
    public static void main(String[] args){
        ArrayList<HinaDoll> list = new ArrayList<HinaDoll>();
        list.add(new HinaDoll("小鼓",3));
        list.add(new HinaDoll("太鼓",5));
        list.add(new HinaDoll("笛",2));
        list.add(new HinaDoll("扇",1));
        list.add(new HinaDoll("大鼓",4));
        
        Collections.sort(list);
        
        for(HinaDoll hina:list){
            hina.show();
        }
    }
}