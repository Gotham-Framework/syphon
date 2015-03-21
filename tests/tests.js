module("Syphon Get");

test("Checkboxes not checked must return false", 1, function() {

  syphon = new Syphon();
  datas = syphon.get('#checkboxes-not-checked-false');

  deepEqual(datas.vehicle, false);

});

test("Radios not checked must return false", 1, function() {

  syphon = new Syphon();
  datas = syphon.get('#radios-not-checked-false');

  deepEqual(datas.vehicle, false);

});

test("Can read all html basic types", 5, function() {

  syphon = new Syphon();
  datas = syphon.get('#all-html-basic-types');

  deepEqual(datas.textarea, 'textarea');
  deepEqual(datas.text, 'text');
  deepEqual(datas.password, 'password');
  deepEqual(datas.checkbox, 'checkbox3');
  deepEqual(datas.radio, 'radio2');

});

test("Can read extra html5 types", 6  , function() {

  syphon = new Syphon();
  datas = syphon.get('#extra-html5-types');

  deepEqual(datas.color, '#000000');
  deepEqual(datas.range, '5');
  deepEqual(datas.number, '4');
  deepEqual(datas.date, '2015-03-03');
  deepEqual(datas.month, '2015-03');
  deepEqual(datas.week, '2015-W10');

});

// Test for nothing returns empty object
// Test to check weird name inputs