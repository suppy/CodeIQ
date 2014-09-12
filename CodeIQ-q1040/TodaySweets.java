//今日のお菓子をもらうためのクラス
public class TodaySweets {
    public static void main(String[] args) {
        SweetsMediator mediator = new Mama(20);
        Sisters Becky = new Becky("ベッキー",Sweets.BISCUIT.toString());
        Sisters Cathy = new Cathy("キャシー",Sweets.CANDY.toString());
        Sisters Michel = new Michel("ミシェル",Sweets.CHOCOLATE.toString());
        mediator.addSisters(Becky);
        mediator.addSisters(Cathy);
        mediator.addSisters(Michel);
        Becky.setSweetsMediator(mediator);
        Cathy.setSweetsMediator(mediator);
        Michel.setSweetsMediator(mediator);
        System.out.println("ベッキーはママからチョコレートを" + Becky.getChocolate()+"個もらいました。");
        System.out.println("キャシーはママからチョコレートを" + Cathy.getChocolate()+"個もらいました。");
        System.out.println("ミシェルはママからチョコレートを" + Michel.getChocolate()+"個もらいました。");
    }
}