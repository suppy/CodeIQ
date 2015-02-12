208.times{|i|$><<(i%26+97-(i%8==0?32:0)).chr}
208.times{|i|$><<((i%8==0?-32:0)+i%26+97).chr}
208.times{|i|$><<(i%26+(i%8==0?65:97)).chr}
208.times{|i|$><<"%c"%(i%26+(i%8==0?65:97))}
208.times{|i|putc i%26+(i%8==0?65:97)}
puts ((?a..?z).to_a.join()*8).scan(/.{8}/).map{|s|s.capitalize}.join()
$><<((?a..?z).to_a.join*8).scan(/.{8}/).map{|s|s.capitalize}.join
$><<([*?a..?z].join*8).scan(/.{8}/).map{|s|s.capitalize}.join
$><<(([*?a..?z].*'')*8).scan(/.{8}/).map{|s|s.capitalize}.join
$><<(([*?a..?z]*'')*8).scan(/.{8}/).map{|s|s.capitalize}*''
$><<([*?a..?z]*8*'').scan(/.{8}/).map{|s|s.capitalize}*''
([*?a..?z]*8*'').scan(/.{8}/){|s|$><<s.capitalize}
([*?a..?z]*8).join.scan(/.{8}/){|s|$><<s.capitalize}
0.upto(207){|i|putc i%26+(i%8==0?65:97)}
