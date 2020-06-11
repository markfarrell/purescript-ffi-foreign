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

exports.entries_ = function(tuple) {
  return function(input) {
    var output = [];
    Object.entries(input).forEach(function(keyValue) {
      var key = keyValue[0];
      var value = keyValue [1];
      output.push(tuple(key)(value));
    });
    return output;
  };
};
