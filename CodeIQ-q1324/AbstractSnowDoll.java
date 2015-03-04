//á‘œ’ŠÛƒNƒ‰ƒX
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
        sb.append(this.tripletsName).append("‚Í").append(this.friendName).append("‚Æ");
        sb.append(snowDoll).append("‚ğ").append(this.snowDollCount).append("ŒÂ");
        sb.append("ì‚è‚Ü‚µ‚½B");
        
        return sb.toString();
    }
    
    public abstract void makeSnowDoll();
    
}