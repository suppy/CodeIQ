//�ᑜ���ۃN���X
public abstract class AbstractSnowDoll {
    
    protected String tripletsName;
    protected String friendName;
    protected int snowDollCount;
    
    public void settripletsName(String tripletsName){
        this.tripletsName = tripletsName;
    }
    
    public void setfriendName(String friendName){
        this.friendName = friendName;
    }
    
    public void setsnowDollCount(int snowDollCount){
        this.snowDollCount = snowDollCount;
    }
    
    public String getSnowDollInfo(String snowDoll){
        StringBuffer sb = new StringBuffer();
        sb.append(this.tripletsName).append("��").append(this.friendName).append("��");
        sb.append(snowDoll).append("��").append(this.snowDollCount).append("��");
        sb.append("���܂����B");
        
        return sb.toString();
    }
    
    public abstract void makeSnowDoll();
    
}