<?php
$dates = array();
$weeks = array("日","月","火","水","木","金","土");
$week_num = date('w', mktime (0, 0, 0, 2, 1, 2014));
for ($i = 1; $i <= 28; $i++) {
    $dates[$i]['day'] = $weeks[$week_num];
	$week_num++;
	if ($week_num == 7) $week_num = 0;
}
print_r($dates);