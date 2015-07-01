public class Person {
        private String name;
        private String dateOfBirth;
        public Person(String name) {
                this.name = name;
        }
        public String getName() {
                return name;
        }
        public String getDateOfBirth() {
                return dateOfBirth;
        }
        public void setDateOfBirth(String dateOfBirth) {
                this.dateOfBirth = dateOfBirth;
        }
}