<?php
    function stop($val){
        return !$val;
    }
    
    $data = array("シドニー"=>true,"東京"=>false,"ロンドン"=>false,"北京"=>true,"アトランタ"=>true);
    
    $stops = array_filter($data,"stop");
    $keys = array_keys($stops);
    
    foreach($keys as $key){
        echo $key."<br>";
    }