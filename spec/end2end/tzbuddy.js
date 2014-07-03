module.exports = {
  "Test time conversion" : function (browser) {
    browser
      .url("http://localhost:4567")
      .waitForElementVisible('body', 1000)
      .setValue('input#tzinput', '10am PST 07/01')
      .pause(1000)
      .assert.containsText('#result', 'Tue Jul 01 2014, 9:00 PM')
      .clearValue('input#tzinput')
      .setValue('input#tzinput', 'invalid date')
      .pause(1000)
      .assert.containsText('#result', 'Invalid Date')
      .clearValue('input#tzinput')
      .setValue('input#tzinput', '10pm 07/03 Moscow Time to Pacific Time')
      .pause(1000)
      .assert.containsText('#result', 'Thu Jul 03 2014, 11:00 AM')
      .end();
  }
};
