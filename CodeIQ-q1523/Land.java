public class Land extends AllergyCheck {
    public Land(String name) {
        super(name);
    }
    @Override
    public void setCheckResult() {
        this.checkResult.put("�X�M",AllergyCheckResult.YOSEI);
        this.checkResult.put("�q�m�L",AllergyCheckResult.YOSEI);
        this.checkResult.put("�n���m�L", AllergyCheckResult.YOSEI);
        this.checkResult.put("�V���J���o",AllergyCheckResult.YOSEI);
        this.checkResult.put("�R�i��", AllergyCheckResult.YOSEI);
        this.checkResult.put("�u�i", AllergyCheckResult.YOSEI);
        this.checkResult.put("�n���K��",AllergyCheckResult.YOSEI);
        this.checkResult.put("�J���K��", AllergyCheckResult.YOSEI);
        this.checkResult.put("�I�I�A���K�G��", AllergyCheckResult.YOSEI);
    }
}