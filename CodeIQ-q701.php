<?php
    class Boy{
        static $choco = "義理";
        
        function pass($name){
            echo $name."君は、".self::$choco."チョコ<br>";
        }
    }
    
    class FavBoy extends Boy{
        static $choco = "本命";
    }
    
    $boy = new Boy();
    $boy->pass("山田");          // (1)
    
    $boy = new FavBoy();
    $boy::pass("木村");           // (2)
    
    $boy = new FavBoy();
    $boy->pass("青木");          // (3)