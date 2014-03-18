<?php
 $dates = array(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
 for ($i = 1; $i < count($dates); $i++) {
     $weeks = array("日","月","火","水","木","金","土");
     $week_num = date('w', mktime (0, 0, 0, 2, $i, 2014));
     $dates[$i]['day'] = $weeks[$week_num];
 }
 print_r($dates);