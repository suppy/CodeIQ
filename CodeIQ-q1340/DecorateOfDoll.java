class DecorateOfDoll extends Doll{
    String doll_c3;
    String doll_c4;
    String doll_c5;
    
    DecorateOfDoll(){
        doll_c1="お内裏様";
        doll_c2="お雛様";
        doll_c3="三人官女";
        doll_c4="五人囃子";
        doll_c5="大臣";
    }
    
    void getDollType(){
        System.out.println(super.doll_c1);
        System.out.println(super.doll_c2);
        System.out.println(doll_c3);
        System.out.println(doll_c4);
        System.out.println(doll_c5);
    }
}