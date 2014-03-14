public class PriAns_Rie{
    //チョコを置いた場所を格納
    private String chocoPlace;
    public void setChocoPlace(){
        try{
            chocoPlace = "下駄箱";
            throw new Exception();
        }catch(Exception e){
            chocoPlace = "ロッカー";
            return;
        }finally{
            chocoPlace = "机の中";
        }
    }
    
    public String getChocoPlace(){
        return chocoPlace;
    }
    public static void main(String[] args){
        PriAns_Rie rie = new PriAns_Rie();
        rie.setChocoPlace();
        System.out.println(rie.getChocoPlace());
    }
}