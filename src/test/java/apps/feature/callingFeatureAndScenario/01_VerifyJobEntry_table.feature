Feature: Validate job entry when pass through table - calling scenarios from other feature file

  Scenario: Verfiy job entry which is newly created with multiple sets of data using Table
    * table jobEntries
      | jobid | jobtitle  | jobdescription |
      |    91 | 'SDET'    | 'SDET-91'      |
      |    92 | 'Manager' | 'Manager-92'   |
    * def result = call read('01_helperFeature_Createjobentry.feature@tag201') jobEntries
    * print result

  Scenario: Verfiy job entry which is newly created with multiple sets of data using Table
    * table jobEntries
      | jobid   | jobtitle  | jobdescription  |
      | 'id'    | 'Manager' | 'Manager-id'    |
      | 'anand' | 'sdet'    | 'sr Manager-id' |
    * def result = call read('01_helperFeature_Createjobentry.feature@tag400') jobEntries
    * print result
