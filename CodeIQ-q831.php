<?php
    class BluePaper{
        public $class1 = "1年1組";
        public $class2 = "1年2組";
        function getClass(){
            $class1 = "class2";
            return $this->$class1."<br>";
        }
    }
    
    class RedPaper{
        public $class1 = "1年1組";
        public $class2 = "1年2組";
        function getClass(){
            $class1 = "class2";
            return $this->class1."<br>";
        }
    }
    
    $masa = new BluePaper();
    $erika = new RedPaper();
    echo "マサ君は".$masa->getClass();
    echo "エリカちゃんは".$erika->getClass();