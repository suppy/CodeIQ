public class Ocean extends AllergyCheck {
    public Ocean(String name) {
        super(name);
    }
    @Override
    public void setCheckResult() {
        this.checkResult.put("�X�M",AllergyCheckResult.INSEI);
        this.checkResult.put("�q�m�L",AllergyCheckResult.YOSEI);
        this.checkResult.put("�n���m�L", AllergyCheckResult.YOSEI);
        this.checkResult.put("�V���J���o",AllergyCheckResult.YOSEI);
        this.checkResult.put("�R�i��", AllergyCheckResult.INSEI);
        this.checkResult.put("�u�i", AllergyCheckResult.INSEI);
        this.checkResult.put("�n���K��",AllergyCheckResult.INSEI);
        this.checkResult.put("�J���K��", AllergyCheckResult.INSEI);
        this.checkResult.put("�I�I�A���K�G��", AllergyCheckResult.INSEI);
    }
}