// 各種設定値管理クラス
class Config {
    // 定数定義
//    private final static int[] INTEREST_RATES = {  5        // 商品1の利率 5%
    private final int[] INTEREST_RATES = {  5        // 商品1の利率 5%
                                                , 15};        // 商品2の利率 15%
    public int[] getInterestRates() {
        return INTEREST_RATES;
    }
}