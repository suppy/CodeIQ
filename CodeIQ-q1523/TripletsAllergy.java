public class TripletsAllergy {
    /**
     * @param args
     */
    public static void main(String[] args) {
        AllergyCheck sora = new Sky("��i����j");
        AllergyCheck kai = new Ocean("�C�i�����j");
        AllergyCheck riku = new Land("���i�肭�j");
        sora.setCheckResult();
        kai.setCheckResult();
        riku.setCheckResult();
        sora.getCheckResult();
        kai.getCheckResult();
        riku.getCheckResult();
    }
}