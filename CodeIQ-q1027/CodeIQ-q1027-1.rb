require'prime'
a=[]
(2..999).each{|i|a<<i if Prime.prime?(i)}
$><<a.join(':')