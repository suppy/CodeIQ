public class MatthewComing {
    public static void main(String[] args) {
        final String present = "�l���Q�[��";
        HouseSitting becky = new Becky("�x�b�L�[");
        HouseSitting cathy = new Cathy("�L���V�[");
        HouseSitting michel = new Michel("�~�V�F��");
        becky.setPresent();
        cathy.setPresent();
        michel.setPresent();
        becky.comeSomeone(present);
        cathy.comeSomeone(present);
        michel.comeSomeone(present);
    }
}