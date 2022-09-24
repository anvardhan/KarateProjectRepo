Feature: Feature to be called by other feature

  Background: set base url and other reusable component
    Given url 'https://jobportalkarate.herokuapp.com'

  Scenario: get job description from jobportal
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    And header accept = 'application/json'
    When method get
    Then status 200
    

  