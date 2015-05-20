public class Ocean extends AllergyCheck {
    public Ocean(String name) {
        super(name);
    }
    @Override
    public void setCheckResult() {
        this.checkResult.put("スギ",AllergyCheckResult.INSEI);
        this.checkResult.put("ヒノキ",AllergyCheckResult.YOSEI);
        this.checkResult.put("ハンノキ", AllergyCheckResult.YOSEI);
        this.checkResult.put("シラカンバ",AllergyCheckResult.YOSEI);
        this.checkResult.put("コナラ", AllergyCheckResult.INSEI);
        this.checkResult.put("ブナ", AllergyCheckResult.INSEI);
        this.checkResult.put("ハルガヤ",AllergyCheckResult.INSEI);
        this.checkResult.put("カモガヤ", AllergyCheckResult.INSEI);
        this.checkResult.put("オオアワガエリ", AllergyCheckResult.INSEI);
    }
}