<?php
// 株式会社パワーハウス  障子 慎一＠番犬Pちゃんチャレンジ塾さんからのPHPの問題
// プリッとAnswer「僕の卒業式」
// https://codeiq.jp/ace/shoji_shinichi/q728

function graduationday(){
    //下の1行は下記カレンダーを参照して取得できる値を確認して下さい。
    $wf = (int)date('w',mktime(0,0,0,3,1,2014));
    
    $fd = 5 - $wf + 1;
    if($fd <= 0){
        $fd += 7;
    }
    
    $result = $fd + 7 * (2 - 1);
    
    return $result;
}
echo "卒業式は".graduationday()."日";