class Home{
    Person person;
    Home(Person person){
        this.person = person;
    }
        
    void getOtoshidama(){
        
        if(person instanceof Ojisan){
            person.otoshidama.add("�m��Ȃ��I�W�T��");
        }
        if(person instanceof Ojiichan){
            person.otoshidama.add("�����������");
        }
        if(person instanceof Obaachan){
            person.otoshidama.add("���΂������");
        }
    }
}