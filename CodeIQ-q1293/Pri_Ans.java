public class Pri_Ans{
    public static void main(String[] args){
        SushiYa[] mise ={new Daisou(),new Daisou(),new California(),new California(),new California()}; 
        
        ((SushiYa)mise[0]).vote();
        mise[1].vote();
        mise[2].vote();
        ((California)mise[3]).vote();
        mise[4].vote();
    }
}