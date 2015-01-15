//ママクラス
public class Mama {
    
    private BuildRecipe buildRecipe;
    
    public void Material(){
        this.buildRecipe.cookEgg("ばあばの養鶏場の卵");
        this.buildRecipe.cookShrimp("パパが獲ってきたクルマエビ");
        this.buildRecipe.cookRice("じいじが作ったお米");
    }
    
    public void setBuildRecipe(BuildRecipe buildRecipe){
        this.buildRecipe = buildRecipe;
    }
}