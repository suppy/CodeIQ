//�O�q�����N���X
public class TripletsCooking {
    public static void main(String[] args) {
        Mama mama = new Mama();
        BuildRecipe BeckyCook = new TemakiSushi();
        BuildRecipe CathyCook = new EbiChahang();
        BuildRecipe MichelCook = new EbiPilaf();
        
        mama.setBuildRecipe(BeckyCook);
        mama.Material();
        System.out.println("�x�b�L�[�����킷��" + BeckyCook.doCooking());
        
        mama.setBuildRecipe(CathyCook);
        mama.Material();
        System.out.println("�L���V�[�����킷��" + CathyCook.doCooking());
        
        mama.setBuildRecipe(MichelCook);
        mama.Material();
        System.out.println("�~�V�F�������킷��" + MichelCook.doCooking());
    }
}