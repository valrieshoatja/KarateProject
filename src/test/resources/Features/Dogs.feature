Feature: Dog CEO API Testing

  Background:
    * url baseUrl

  Scenario: Get list of all dogs
    Given path 'breeds/list/all'
    When method GET
    Then status 200
    And match response.status == 'success'

  Scenario: Get random dog image
    Given path 'breeds/image/random'
    When method GET
    Then status 200
    And match response.status == 'success'

  Scenario: Get breed images
    Given path 'breed/hound/images'
    When method GET
    Then status 200
    And match response.status == 'success'
