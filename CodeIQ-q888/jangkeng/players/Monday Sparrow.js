"use strict";

/*
 PlayerName="Monday Sparrow"
 
 30回目までは乱数表。
 残りは、勝った時に出していて、負けたときには出していなかった手を出す
*/

function win( a, b )
{
  var table = { GC:1, CP:1, PG:1 };
  return 0 | table[ a+b ];
}

function play(h)
{
  var me=h[0];
  if ( me.length<30 ){
    return "PPCPCGGCGGCCPGPCGCGCCGPPPPGPGC"[me.length]
  }
  var en=h[1];
  var r={G:0.3, P:0.2, C:0.1}; // 同点だった場合に G 優先。
  for( var i in me ){
    r[ me[i] ] += win( me[i], en[i] ) - win( en[i], me[i] );
  }
  if ( r.G < r.P && r.C<r.P ){
    return "P";
  } else {
    return r.G<r.C ? "C" : "G";
  }
}

self.addEventListener('message', function(e) {
  self.postMessage( play(e.data.split(",")) );
}, false);
