'use strict';

var $$Array = require("./array.js");
var Curry   = require("./curry.js");

function $$return(prim) {
  return Promise.resolve(prim);
}

function make(prim) {
  return new Promise(Curry.__2(prim));
}

function bind(prim, prim$1) {
  return prim$1.then(Curry.__1(prim));
}

function map(fn) {
  return (function (param) {
      return param.then((function (v) {
                    return Promise.resolve(Curry._1(fn, v));
                  }));
    });
}

function join(plist) {
  return (function (param) {
              return bind((function (v) {
                            return Promise.resolve($$Array.to_list(v));
                          }), param);
            })(Promise.all($$Array.of_list(plist)));
}

function race(plist) {
  return Promise.race($$Array.of_list(plist));
}

function tap(fn) {
  return (function (param) {
      return param.then((function (v) {
                    Curry._1(fn, v);
                    return Promise.resolve(v);
                  }));
    });
}

function complete() {
  return /* () */0;
}

function async(fn) {
  Curry._1(fn, /* () */0);
  return /* () */0;
}

function $great$great$eq(p, fn) {
  return p.then(Curry.__1(fn));
}

function $great$pipe$eq(p, fn) {
  return bind((function (v) {
                return Promise.resolve(Curry._1(fn, v));
              }), p);
}

function $less$unknown$great(p, p$prime) {
  return Promise.race($$Array.of_list(/* :: */[
                  p,
                  /* :: */[
                    p$prime,
                    /* [] */0
                  ]
                ]));
}

function $less$unknown$great$1(p, p$prime) {
  return join(/* :: */[
              p,
              /* :: */[
                p$prime,
                /* [] */0
              ]
            ]);
}

var Infix = /* module */[
  /* >>= */$great$great$eq,
  /* =<< */bind,
  /* >|= */$great$pipe$eq,
  /* =|< */map,
  /* <?> */$less$unknown$great,
  /* <&> */$less$unknown$great$1
];

var Monad = /* module */[
  /* return */$$return,
  /* make */make,
  /* bind */bind,
  /* map */map,
  /* join */join,
  /* race */race,
  /* tap */tap,
  /* complete */complete,
  /* async */async,
  /* Infix */Infix
];

exports.Monad = Monad;
/* No side effect */
