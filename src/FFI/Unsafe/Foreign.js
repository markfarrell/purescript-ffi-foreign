"use strict";

exports.try_ = function(left) {
  return function(right) {
    return function(f) {
      return function(x) {
        try {
          var y = f(x);
          return right(y);
        } catch (e) {
          return left(e);
        }
      };
    };
  };
};
