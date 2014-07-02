module.exports = {
  "Test time conversion" : function (browser) {
    browser
      .url("http://localhost:4567")
      .waitForElementVisible('body', 1000)
      .setValue('input#tzinput', '10am PST this Tuesday')
      .pause(1000)
      .assert.containsText('#result', 'July 1, 2014 9:00pm')
      .clearValue('input#tzinput')
      .setValue('input#tzinput', 'invalid date')
      .pause(1000)
      .assert.containsText('#result', 'Invalid Date')
      .end();
  }
};
