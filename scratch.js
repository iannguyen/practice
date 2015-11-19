// scratch

var User = function(email) {
  this.email = email;
};

User.prototype.setPassword = function (password) {
  Object.defineProperty(this, "password", {
    set: function(password) {
      this.password = password;
    }
  });
};

User.prototype.authenticate = function (password) {
  if (this.password === password) {
    return "success";
  }
};
