require'prime'
a=[]
Prime.each(999){|p|a<<p}
$><<a.join(':')