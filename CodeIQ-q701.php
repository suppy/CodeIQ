<?php
    class Boy{
        static $choco = "�`��";
        
        function pass($name){
            echo $name."�N�́A".self::$choco."�`���R<br>";
        }
    }
    
    class FavBoy extends Boy{
        static $choco = "�{��";
    }
    
    $boy = new Boy();
    $boy->pass("�R�c");          // (1)
    
    $boy = new FavBoy();
    $boy::pass("�ؑ�");           // (2)
    
    $boy = new FavBoy();
    $boy->pass("��");          // (3)