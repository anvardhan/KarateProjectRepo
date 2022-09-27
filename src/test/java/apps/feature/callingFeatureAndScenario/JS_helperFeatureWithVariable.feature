Feature: Helper feature file - should only be called by any calling feature file
  Helper feature file should only contain one scenario with all required variables, functions and operations

  Scenario: pass variables data from calling to this helper feature
    #Operations for API reusbale task
    Given url _url
    And path _path
    And request {jobid: '#(_id)'}
    And print "url from calling feature file: ",_url
    And print "path from calling feature file: ",_path
    And print "id from calling feature file: ",_id
