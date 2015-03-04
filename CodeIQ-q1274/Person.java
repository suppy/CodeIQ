import java.util.Set;

interface Ojisan{}
interface Ojiichan{}
interface Obaachan extends Ojiichan{}

class Person implements Obaachan{
    Set<String> otoshidama;
    Person(Set<String> otoshidama){
        this.otoshidama = otoshidama;
    }
}