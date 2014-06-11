"use strict";

/*
 PlayerName="Careless Rabbit"

 勝っている間は手を変えない。
 負けたら必ず、あいこでもたまに、前回と違う手を出す。
*/

var hand="P";
var hands="GPCGPC";

function play( h )
{
  var n=h[0].length;
  if ( 0<n ){
    var me=hands.indexOf( h[0][n-1] );
    var en=hands.indexOf( h[1][n-1] );
    if ( (en==me && 0===n%9) || (en+2-me)%3===0 ){
      hand=hands[en+1];
    }
  }
  return hand;
}

self.addEventListener('message', function(e) {
  self.postMessage( play(e.data.split(",")) );
}, false);
