// scratch

var count = 0;

var clock = function() {
  count += 1;
  console.log(new Date());
};

var tick = setInterval(function() {
  if (count < 10) {
    clock();
  }
  else {
    clearInterval(tick);
  }
}, 1000);
