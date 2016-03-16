// Incomplete

Array.prototype.quickSort = function(start, len) {
  if (typeof len === "undefined") {
    len = this.length;
  }
  if (len < 2) {
    return this;
  }

};

Array.prototype.swap = function (idx1, idx2) {
  var temp = this[idx1];
  this[idx1] = this[idx2];
  this[idx2] = temp;
};
