"use strict";

/*
 PlayerName="Fashionable  Crocodile"

 パーグーチョキグーの繰り返し
*/

var count=0;

function play(){
  return "PGCG"[(count++)%4];
}

self.addEventListener('message', function(e) {
    self.postMessage( play() );
}, false);
