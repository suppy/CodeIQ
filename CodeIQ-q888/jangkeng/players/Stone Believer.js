"use strict";

/*
 PlayerName="Stone Believer"
 
 ずっとグーを出す。
*/

function play()
{
  return "G";
}

self.addEventListener('message', function(e) {
  self.postMessage( play() );
}, false);
