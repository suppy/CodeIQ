public abstract class HouseSitting {
    protected String name;
    protected String present;
    public HouseSitting(String name){
        this.name = name;
    }
    public void comeSomeone(String present){
        if(present.equals(this.present)){
            System.out.println(this.name + "�̓h�A���J���Ă��܂����I�I");
        }else{
            System.out.println(this.name + "�̓h�A���J���Ȃ��I�I");
        }
    }
    abstract public void setPresent();
}