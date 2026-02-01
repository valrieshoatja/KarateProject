package DogsAPITests;

import com.intuit.karate.junit5.Karate;

public class DogsTests {

    @Karate.Test
    Karate runAllDogAPITests() {
        return Karate.run("classpath:Features/Dogs.feature");
    }
}
