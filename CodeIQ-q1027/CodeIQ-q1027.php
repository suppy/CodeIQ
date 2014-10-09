for($i=0;$i<999;$i++)if(gmp_prob_prime($i)){print($i);($i!=997)?print(":"):0;}
for($i=0;$i++<999;)if(gmp_prob_prime($i)){print($i);$i!=997?print(":"):0;}
$i=0;while($i++<999)if(gmp_prob_prime($i)){print($i);$i!=997?print(":"):0;}
for($i=0;$i++<999;)if(gmp_prob_prime($i)){printf($i!=997?"%d:":"%d",$i);}
for($i=0;$i++<996;)if(gmp_prob_prime($i)){printf("%d:",$i);}print(997);
for($i=0;$i++<996;)if(gmp_prob_prime($i))printf("%d:",$i);print(997);
for($i=0;$i++<996;)gmp_prob_prime($i)?printf("%d:",$i):0;print(997);
~for($i=0;$i++<995;)printf("%d:",$i=gmp_strval(gmp_nextprime($i)));print(997);