"use strict";

/*
 PlayerName="King Pangolin" 

  前半は乱数表。後半は最近相手が出していない手に負けるもの。  
*/
function count( s, len, t )
{
  var regex = new RegExp(t, "g");
  return (s.substr(s.length-len, len ).match(regex)||[]).length;
}

function play(h){
  var n=h[1].length;
  if ( n<50 ){
    // 50回目までは 乱数表
    return "PGGPCCPCCGCGGCGPGCPGGCPGGGPGGCCPCPCPPCGPGCPPGCGPCP"[n];
  } else {
    // 50回目以降は、最近相手が出していない手に負ける手を出す
    var len= 5;
    var g=count(h[1],len,"G");
    var c=count(h[1],len,"C");
    var p=count(h[1],len,"P");
    return "GP_C"[3*( g<=c && g<=p ) | (c<p) ];
  }
}

self.addEventListener('message', function(e) {
  self.postMessage( play(e.data.split(",")) );
}, false);
