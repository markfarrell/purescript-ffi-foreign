"use strict";

exports.values = Object.values;

exports.keys = Object.keys;

exports.literal_ = function(fst) {
  return function(snd) {
    return function(input) {
      var output = {};
      input.forEach(function(keyValue) {
        var key = fst(keyValue);
        var value = snd(keyValue);
        output[key] = value;
      });
      return output;
    };
  };
};
