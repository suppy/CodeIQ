import java.text.SimpleDateFormat;
import java.util.Calendar;
public class BirthRegistered {
        public static void main(String[] args) {
                Person papa = new Person("パパ");
                Person mama = new Person("ママ");
                Person baby = new Person("赤ちゃん");
                Calendar cal = Calendar.getInstance();
                cal.set(Calendar.YEAR, 1980);
                cal.set(Calendar.MONTH, 7);
                papa.setDateOfBirth(convertCalendarToString(cal));
                cal = Calendar.getInstance();
                cal.set(Calendar.YEAR, 1990);
                cal.add(Calendar.DATE, 1);
                mama.setDateOfBirth(convertCalendarToString(cal));
                cal = Calendar.getInstance();
                cal.roll(Calendar.DATE, 20);
                baby.setDateOfBirth(convertCalendarToString(cal));
                System.out.println(papa.getName() + "の生年月日は" + papa.getDateOfBirth());
                System.out.println(mama.getName() + "の生年月日は" + mama.getDateOfBirth());
                System.out.println(baby.getName() + "の生年月日は" + baby.getDateOfBirth());
        }
        private static String convertCalendarToString(Calendar calendar) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
                return sdf.format(calendar.getTime());
        }
}