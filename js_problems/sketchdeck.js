// a takes a function with 2 parameters f (another function) and d
function a(f, d) {
  // d is an array
  if (d.length > 0) {
    // b will be the last element in d popped, so d's length is reduced by 1 if it is greater than 0
    var b = d.pop();
    // recursively call the a function until d is empty

    // console.log(b);

    a(f, d);
    // call the function f(b), the last element that was popped. push it into d

    // console.log(f(b));
    
    d.push(f(b));
    // d will get reduced until it is empty.
    // the function f will be called on the popped element b, and pushed into d.
    // in the end, the d array should be mutated and have the same number of elements as the original length.

  }
  // the function doesn't return anything, but d will be changed.
}

// test cases

function f(number) {
  return number + 1;
}

array = [1,2,3];
console.log(array);

console.log(a(f, array));

console.log(array);
