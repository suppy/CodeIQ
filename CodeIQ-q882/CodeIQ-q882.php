<?php
    class FirstDay{
        public $dig1 = 7;
        public $dig2 = 4;
        private $dig3 = 6;
        protected $dig4 = -5;
    }
    
    class SecondDay extends FirstDay{
        function __construct(){
            $dig1 = 5;
            $dig2 = 9;
            $dig3 = 4;
            $dig4 = 2;
        }
        function getAsari(){
            $sum = 0;
            foreach($this as $val){
                $sum += $val;
            }
            return $sum;
        }
    }
    $fday = new FirstDay();
    $f_sum = 0;
    foreach($fday as $val){
        $f_sum += $val;
    }
    echo "1“ú–ÚF".$f_sum."ŒÂ<br>";
    
    $sday = new SecondDay();
    $s_sum = $sday->getAsari();
    echo "2“ú–ÚF".$s_sum."ŒÂ<br>";
