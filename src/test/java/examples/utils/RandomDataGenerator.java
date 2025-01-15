package examples.utils;

import com.github.javafaker.Faker;

public class RandomDataGenerator {

    static Faker faker = new Faker();
    public static String getRandomId() {
        return faker.number().digits(6);
    }
    public static String getRandomEmail() {
        return faker.internet().emailAddress();
    }
}