"use strict";

/*
  PlayerName="Ultimate Stone Slayer"

  相手が一番たくさん出している手に勝つ手を出す。
*/

function count( s, t )
{
  var regex = new RegExp(t, "g");
  return (s.match(regex)||[]).length;
}

function play( h )
{
  var g=count(h[1],"G");
  var c=count(h[1],"C");
  var p=count(h[1],"P");
  if ( c<=g && p<=g ){
    return "P";
  }
  return c<p ? "C" : "G";
}

self.addEventListener('message', function(e) {
  self.postMessage( play(e.data.split(",")) );
}, false);
