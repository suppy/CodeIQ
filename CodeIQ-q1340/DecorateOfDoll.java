class DecorateOfDoll extends Doll{
    String doll_c3;
    String doll_c4;
    String doll_c5;
    
    DecorateOfDoll(){
        doll_c1="�������l";
        doll_c2="�����l";
        doll_c3="�O�l����";
        doll_c4="�ܐl���q";
        doll_c5="��b";
    }
    
    void getDollType(){
        System.out.println(super.doll_c1);
        System.out.println(super.doll_c2);
        System.out.println(doll_c3);
        System.out.println(doll_c4);
        System.out.println(doll_c5);
    }
}