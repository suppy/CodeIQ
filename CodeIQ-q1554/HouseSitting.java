public abstract class HouseSitting {
    protected String name;
    protected String present;
    public HouseSitting(String name){
        this.name = name;
    }
    public void comeSomeone(String present){
        if(present.equals(this.present)){
            System.out.println(this.name + "はドアを開けてしまった！！");
        }else{
            System.out.println(this.name + "はドアを開けない！！");
        }
    }
    abstract public void setPresent();
}