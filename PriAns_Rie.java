public class PriAns_Rie{
    //�`���R��u�����ꏊ���i�[
    private String chocoPlace;
    public void setChocoPlace(){
        try{
            chocoPlace = "���ʔ�";
            throw new Exception();
        }catch(Exception e){
            chocoPlace = "���b�J�[";
            return;
        }finally{
            chocoPlace = "���̒�";
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