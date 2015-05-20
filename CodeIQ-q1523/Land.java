public class Land extends AllergyCheck {
    public Land(String name) {
        super(name);
    }
    @Override
    public void setCheckResult() {
        this.checkResult.put("スギ",AllergyCheckResult.YOSEI);
        this.checkResult.put("ヒノキ",AllergyCheckResult.YOSEI);
        this.checkResult.put("ハンノキ", AllergyCheckResult.YOSEI);
        this.checkResult.put("シラカンバ",AllergyCheckResult.YOSEI);
        this.checkResult.put("コナラ", AllergyCheckResult.YOSEI);
        this.checkResult.put("ブナ", AllergyCheckResult.YOSEI);
        this.checkResult.put("ハルガヤ",AllergyCheckResult.YOSEI);
        this.checkResult.put("カモガヤ", AllergyCheckResult.YOSEI);
        this.checkResult.put("オオアワガエリ", AllergyCheckResult.YOSEI);
    }
}