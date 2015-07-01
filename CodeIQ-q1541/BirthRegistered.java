import java.text.SimpleDateFormat;
import java.util.Calendar;
public class BirthRegistered {
        public static void main(String[] args) {
                Person papa = new Person("�p�p");
                Person mama = new Person("�}�}");
                Person baby = new Person("�Ԃ����");
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
                System.out.println(papa.getName() + "�̐��N������" + papa.getDateOfBirth());
                System.out.println(mama.getName() + "�̐��N������" + mama.getDateOfBirth());
                System.out.println(baby.getName() + "�̐��N������" + baby.getDateOfBirth());
        }
        private static String convertCalendarToString(Calendar calendar) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy�NMM��dd��");
                return sdf.format(calendar.getTime());
        }
}