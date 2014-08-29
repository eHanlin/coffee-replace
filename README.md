# Coffee Replace

```javascript

// 使用範例

 var str = "我是#{name}，我的年紀#{age(歲)}。你可以叫我#{name}。#{#{up(a)}#{bc}}測試";
 var data = {
  name : "熱狗",
  age : function(ageUnit){return 33+ageUnit;},
  up : function(str){return str.toUpperCase();},
  bc : function(){return "BC";},
  ABC : "甲乙丙",
  abc : "123"};
 str.coffeeReplace(data);

// 執行過程

 //我是#{name}，我的年級#{age(歲)}。你可以叫我#{name}。#{#{up(a)}#{bc}}測試
 //我是熱狗，我的年級#{age(歲)}。你可以叫我熱狗。#{#{up(a)}#{bc}}測試
 //我是熱狗，我的年級33歲。你可以叫我熱狗。#{#{up(a)}#{bc}}測試
 //我是熱狗，我的年級33歲。你可以叫我熱狗。#{A#{bc}}測試
 //我是熱狗，我的年級33歲。你可以叫我熱狗。#{ABC}測試
 //我是熱狗，我的年級33歲。你可以叫我熱狗。甲乙丙測試


// example

 var str = "I am #{name}，#{age( old)}. you can call me #{name}.#{#{up(a)}#{bc}} test";
 var data = {
  name : "hotdog",
  age : function(ageUnit){return 33+ageUnit;},
  up : function(str){return str.toUpperCase();},
  bc : function(){return "BC";},
  ABC : "I II III",
  abc : "123"};
 str.coffeeReplace(data);

//process
 
 //I am #{name}，#{age( old)}. you can call me #{name}.#{#{up(a)}#{bc}} test
 //I am hotdog，#{age( old)}. you can call me hotdog.#{#{up(a)}#{bc}} test
 //I am hotdog，33 old. you can call me hotdog.#{#{up(a)}#{bc}} test
 //I am hotdog，33 old. you can call me hotdog.#{A#{bc}} test
 //I am hotdog，33 old. you can call me hotdog.#{ABC} test
 //I am hotdog，33 old. you can call me hotdog.I II III test

```
