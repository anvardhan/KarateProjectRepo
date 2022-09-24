Feature: get jobportal details - XML

  Background: set base url and other reusable component
    Given url 'https://jobportalkarate.herokuapp.com'

  Scenario: get job description from jobportal
    Given url 'https://jobportalkarate.herokuapp.com/normal/webapi/all'
    And header accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response ==
      """
      <List>
      <item>
      <jobId>1</jobId>
      <jobTitle>Software Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
      </experience>
      <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
      </project>
      </item>
      <item>
      <jobId>20</jobId>
      <jobTitle>EEE Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
      </experience>
      <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
      </project>
      </item>
      <item>
      <jobId>1</jobId>
      <jobTitle>Software Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
      </experience>
      <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
      </project>
      </item>
      <item>
      <jobId>20</jobId>
      <jobTitle>EEE Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
      </experience>
      <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
      </project>
      </item>
      </List>
      """

 