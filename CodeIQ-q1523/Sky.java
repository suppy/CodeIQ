public class Sky extends AllergyCheck {
    public Sky(String name) {
        super(name);
    }
    @Override
    public void setCheckResult() {
        this.checkResult.put("スギ",AllergyCheckResult.YOSEI);
        this.checkResult.put("ヒノキ",AllergyCheckResult.INSEI);
        this.checkResult.put("ハンノキ", AllergyCheckResult.YOSEI);
        this.checkResult.put("シラカンバ",AllergyCheckResult.INSEI);
        this.checkResult.put("コナラ", AllergyCheckResult.INSEI);
        this.checkResult.put("ブナ", AllergyCheckResult.YOSEI);
        this.checkResult.put("ハルガヤ",AllergyCheckResult.INSEI);
        this.checkResult.put("カモガヤ", AllergyCheckResult.INSEI);
        this.checkResult.put("オオアワガエリ", AllergyCheckResult.INSEI);
    }
}