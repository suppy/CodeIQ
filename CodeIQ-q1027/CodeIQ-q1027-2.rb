a=[]
(2..999).map{|i|p=1
(2...i).map{|j|p=nil if i%j==0}
a<<i if p}
$><<a.join(':')