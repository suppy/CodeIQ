import java.util.Set;
import java.util.HashSet;

public class Pri_Ans{
    public static void main(String[] args){
        Set<String> otoshidama = new HashSet<String>();
        Person kenji = new Person(otoshidama);
        Home home = new Home(kenji);
        home.getOtoshidama();
        
        for(String val:otoshidama){
            System.out.print(val+" ");
        }
        System.out.println();
    }
}