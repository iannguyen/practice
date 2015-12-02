(function(root) {
  'use strict';

  root.User = function(userEmail) {
    var email = userEmail;
    var password;

    this.getEmail = function() {
      return email;
    };

    this.authenticate = function(userPassword) {
      if (password === userPassword) {
        return "success";
      }
    };

    // User.prototype.setPassword = function(userPassword) {
    //   password = userPassword;
    // };

    this.setPassword = function(userPassword) {
      password = userPassword;
    };

  };

}(this));
