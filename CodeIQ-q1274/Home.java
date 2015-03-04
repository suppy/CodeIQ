class Home{
    Person person;
    Home(Person person){
        this.person = person;
    }
        
    void getOtoshidama(){
        
        if(person instanceof Ojisan){
            person.otoshidama.add("知らないオジサン");
        }
        if(person instanceof Ojiichan){
            person.otoshidama.add("おじいちゃん");
        }
        if(person instanceof Obaachan){
            person.otoshidama.add("おばあちゃん");
        }
    }
}