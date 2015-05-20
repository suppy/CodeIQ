public class TripletsAllergy {
    /**
     * @param args
     */
    public static void main(String[] args) {
        AllergyCheck sora = new Sky("空（そら）");
        AllergyCheck kai = new Ocean("海（かい）");
        AllergyCheck riku = new Land("陸（りく）");
        sora.setCheckResult();
        kai.setCheckResult();
        riku.setCheckResult();
        sora.getCheckResult();
        kai.getCheckResult();
        riku.getCheckResult();
    }
}