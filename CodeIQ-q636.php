<?php

function select_boat_member(&$member_list)
{
	$boat_member = array();
//	print_r(count($member_list));
	if (count($member_list) >= 2) {
		switch (rand(1, 5)) {
			case 1:
				array_push($boat_member, array_shift($member_list));
				break;
			case 2:
				array_push($boat_member, array_pop($member_list));
				break;
			case 3:
				array_push($boat_member, array_shift($member_list));
				array_push($boat_member, array_pop($member_list));
				break;
			case 4:
				array_push($boat_member, array_shift($member_list));
				array_push($boat_member, array_shift($member_list));
				break;
			case 5:
				array_push($boat_member, array_pop($member_list));
				array_push($boat_member, array_pop($member_list));
				break;
		}
		
	}
	else {
		$boat_member = $member_list;
		$member_list = array();
	}
//	echo "boat_member:";
//	print_member($boat_member);
//	echo "\n";
	
	return $boat_member;
}

function move_boat(&$left_river_side, &$right_river_side, &$direction)
{
//	print_r($left_river_side);
//	print_r($right_river_side);
//	print_r($direction);
	$pre_left_river_side = $left_river_side;
	$pre_right_river_side = $right_river_side;

	if ($direction == 1) {
		$boat_member = select_boat_member($left_river_side);
		$right_river_side = array_merge($right_river_side, $boat_member);
		sort($right_river_side);
	}
	else {
		$boat_member = select_boat_member($right_river_side);
		$left_river_side = array_merge($left_river_side, $boat_member);
		sort($left_river_side);
	}
//	print_r($boat_member);

	$isEated = isEated($left_river_side, $right_river_side);
	if ($isEated) {
		$left_river_side = $pre_left_river_side;
		$right_river_side = $pre_right_river_side;
		move_boat($left_river_side, $right_river_side, $direction);
	}
	else {
/*
		if ($direction == 1) {
			echo "->";
		}
		else {
			echo "<-";
		}
		print_member($boat_member);
		echo "\n";
*/
		print_status($left_river_side, $right_river_side);
		
		$direction *= -1;
		
		if (count($left_river_side) == 0) {
			return 0;
		}
		else {
			move_boat($left_river_side, $right_river_side, $direction);
		}
	}
}

function isEated($left_river_side, $right_river_side)
{
	$num_S = 0;
	$num_T = 0;
	
	for ($i = 0;$i < count($left_river_side);$i++) {
		if ($left_river_side[$i] == "S") {
			$num_S++;
		}
	}
	$num_T = count($left_river_side) - $num_S;
//	echo $num_S."\n".$num_T."\n";

	if ($num_S == 0 || $num_S == 3) {
		return false;
	}

	if ($num_S < $num_T || (3 - $num_S) < (3 - $num_T)) {
		return true;
	}

	return false;
}


function print_member($member_list)
{
	for ($i = 0;$i < count($member_list);$i++) {
		echo $member_list[$i];
	}
}

function print_status($left_river_side, $right_river_side)
{
	print_member($left_river_side);
	echo "/";
	print_member($right_river_side);
	echo "\n";
}

$left_river_side = array( 'S', 'S', 'S', 'T', 'T', 'T');
$right_river_side = array();
$direction = 1; // 船の方向　1:→　-1:←


print_status($left_river_side, $right_river_side);
move_boat($left_river_side, $right_river_side, $direction);
