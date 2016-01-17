// scratch

function testFunction(a) {

  if (a > 0) {
    var b = a - 1;
    console.log("b is equal to .." + b);
    a--;

    testFunction(a);

    a += b;
    console.log("a is equal to .." + a);
  }
}


// var testnum = 5;
//
// console.log(testFunction(testnum));
//
// console.log("testnum is...");
// console.log(testnum);
//
// function addone (array) {
//   array.push(1);
// }
//
// var arraytest = [1,2,3];
// var num = 1;
//
// addone(arraytest);
// console.log(arraytest);


function outer() {
  var a = 1;
  console.log("outer " + a);
  (function inner () {
    var a = 2;
    console.log("inner " + a);
  })();
  console.log("outer " + a);
}

outer();
