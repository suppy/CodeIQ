require'prime'
$><<Prime.each(999).to_a*":"
$><<(2..999).map{|i|i.prime?}