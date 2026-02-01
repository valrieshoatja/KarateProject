package NdosiAPITests;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Runner;
import com.intuit.karate.Results;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class NdosiApiTests {

    @Karate.Test
    public Karate testNdosiAPI() {
        return Karate.run("classpath:Features/ndosiApi.feature").relativeTo(getClass());
    }

    @Test
    public void testNdosiAPIParallel() {
        Results results = Runner.path("classpath:Features/ndosiApi.feature").parallel(5);

    }
}
