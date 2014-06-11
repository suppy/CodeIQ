"use strict";

/*
PlayerName="suppy193" 
【感想・作戦・工夫した点など】
"Amazing Opossum"に勝つのは難しいと判断
参加者の皆さんは、サンプルのすべてのプレイヤーに勝つプレイヤーをエントリーされるはず
じゃんけんなので、そのプレイヤーに勝てる確率は０ではない
サンプルのプレイヤーにそこそこ勝てるプレイヤーを作成
時間はあまりかけられないので、乱数を調整することしかしていない
あとは運を天に任せます(^_^;)

main.jsなどのコードは勉強になります
*/

var count=0;

function play(h)
{
  // 乱数の繰り返し
  var pattern = "GPGCGPGGPP";
  return pattern[(count++)%pattern.length];;
}

// イベントを受け取り、グーチョキパーのどれを出すかを返信するための仕組みです。
self.addEventListener('message', function(e) {
  self.postMessage( play(e.data.split(",")) );
}, false);
