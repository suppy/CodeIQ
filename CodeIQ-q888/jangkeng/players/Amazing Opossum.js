"use strict";

/*
 PlayerName="Amazing Opossum" 

 直前の手とその直後の手の関係を調査し、調査結果に基づいて出す手を決める。
*/

function key(h,r)
{
  // 一手前の自分と相手、二手前の相手の手をキーとする。
  return h[0][r-1]+h[1][r-1]+h[1][r-2];
}

function play(h){
  var m={};
  var len=h[0].length;
  for( var r=2 ; r<len ; ++r ){
    var k=key(h,r);
    if ( ! m[k] ){
      m[k] = { G:0.2, C:0, P:0.1 };
    }
    m[k][h[1][r]]+=10+r;
  }
  var s = m[key(h,len)];
  if ( ! s ){
    return "GCP"[r%3];
  }
  if ( s.G < s.P && s.C<s.P ){
    return "C";
  }
  return s.G<s.C ? "G" : "P";
}

self.addEventListener('message', function(e) {
  self.postMessage( play(e.data.split(",")) );
}, false);
