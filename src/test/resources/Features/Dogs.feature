Feature: Dog API Testing - Positive & Negative Tests

  # Load reusable API data
  Background:
    * def apiData = read('data/apiData.json')
    * print 'DEBUG apiData =', apiData
    * print 'DEBUG typeof apiData =', typeof apiData
    * def dogAPI = apiData.dog

  # -----------------------------
  # 1️⃣ Basic GET Requests & Data Validation
  # -----------------------------
Scenario: Retrieve list of all dog breeds - Positive
Given url baseUrl + dogAPI.endpoints.allBreeds
When method GET
Then status 200
And match response contains dogAPI.responses.successObject

Scenario: Retrieve list of all dog breeds - Negative (invalid endpoint)
Given url baseUrl + '/breeds/list/all-invalid'
When method GET
Then status 404

Scenario: Retrieve random dog image - Positive
Given url baseUrl + dogAPI.endpoints.randomImage
When method GET
Then status 200
And match response contains dogAPI.responses.successString

Scenario: Retrieve random dog image - Negative (invalid endpoint)
Given url baseUrl + dogAPI.invalidEndpoint
When method GET
Then status 404

  # -----------------------------
  # 2️⃣ Parameter Testing
  # -----------------------------
Scenario: Retrieve images for hound breed - Positive
Given url baseUrl + dogAPI.endpoints.breedImages + dogAPI.validBreeds[0] + '/images'
When method GET
Then status 200
And match response contains dogAPI.responses.successArray

Scenario: Retrieve images for invalid breed - Negative
Given url baseUrl + dogAPI.endpoints.breedImages + dogAPI.invalidBreed + '/images'
When method GET
Then status 404

Scenario: Retrieve sub-breeds for hound - Positive
Given url baseUrl + dogAPI.endpoints.subBreedList + dogAPI.validBreeds[0] + '/list'
When method GET
Then status 200
And match response contains dogAPI.responses.successArray

Scenario: Retrieve sub-breeds for invalid breed - Negative
Given url baseUrl + dogAPI.endpoints.subBreedList + dogAPI.invalidBreed + '/list'
When method GET
Then status 404

  # -----------------------------
  # 3️⃣ Response Consistency
  # -----------------------------
Scenario: Verify response structure for hound images
Given url baseUrl + dogAPI.endpoints.breedImages + dogAPI.validBreeds[0] + '/images'
When method GET
Then status 200
And match response contains dogAPI.responses.successArray

  # -----------------------------
  # 4️⃣ Performance Testing
  # -----------------------------
Scenario: Verify response time for random dog image
Given url baseUrl + dogAPI.endpoints.randomImage
When method GET
Then status 200
And assert responseTime < 2000
