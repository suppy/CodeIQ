<?php
//PHP5.4以降の環境で動作
class Sketch{
    public $paint = array("緑","赤","青","黒","黄","白");
    
    public function colorCheck($palette){
        $cnt = 0;
        foreach($palette as $color){
            if(isset($this->paint[$color])){
                echo $this->paint[$color]."<br>";
                $cnt++;
            }
        }
        return $cnt;
    }
}
$palette = array(0,'1',2.6,"3.2",'黄',"White");
$obj = new Sketch();
$cnt = $obj->colorCheck($palette);
echo "使用した絵の具：".$cnt."色";
