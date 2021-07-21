### ToolBox for testing software

this packages have : 
- Selenium
- Google-chrome Headless
- Jest
- utils for simulate chrome


#### How to use this package ?

1. go to docker hub
2. download container
3. use this image

#### Example in gitlab CI tasks
    integration_test:
      image: akarah:testing
      needs: ["build"]
      script:
        - npm run dev &
        - npm test -- tests/Selenium.test.js --host=selenium__standalone-chrome
      variables:
      SELENIUM_HOST: "selenium-standalone-chrome"
      services:
        - name: selenium/standalone-chrome:latest


