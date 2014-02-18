def make_gemstring(gemstring,
		array_a, array_b, array_c,
		array_d, array_e, array_f,
		array_g, minilist)

	gemstring2 = gemstring
	array_a2 = array_a.clone
	array_b2 = array_b.clone
	array_c2 = array_c.clone
	array_d2 = array_d.clone
	array_e2 = array_e.clone
	array_f2 = array_f.clone
	array_g2 = array_g.clone
# p gemstring2
# p array_a2	
#	minilist << gemstring2
	minilist.push(minilist.pop + 1)
	
	princess = "eagcdfbe"
	
	if gemstring2 == princess
#		p minilist.size
		p minilist
#		p days
		exit
	end
	
	if gemstring2.length == 3
		p gemstring2
		p minilist
	end
	
	if array_a2.length > 0
		gemstring2 = gemstring2 + array_a2.pop
#		p gemstring
		make_gemstring(gemstring2,
			array_a2, array_b2, array_c2,
			array_d2, array_e2, array_f2,
			array_g2, minilist)
	end

	gemstring2 = gemstring
	array_a2 = array_a.clone
	array_b2 = array_b.clone
	array_c2 = array_c.clone
	array_d2 = array_d.clone
	array_e2 = array_e.clone
	array_f2 = array_f.clone
	array_g2 = array_g.clone
	
	if array_b2.length > 0
		gemstring2 = gemstring2 + array_b2.pop
		make_gemstring(gemstring2,
			array_a2, array_b2, array_c2,
			array_d2, array_e2, array_f2,
			array_g2, minilist)
	end

	gemstring2 = gemstring
	array_a2 = array_a.clone
	array_b2 = array_b.clone
	array_c2 = array_c.clone
	array_d2 = array_d.clone
	array_e2 = array_e.clone
	array_f2 = array_f.clone
	array_g2 = array_g.clone

	if array_c2.length > 0
		gemstring2 = gemstring2 + array_c2.pop
		make_gemstring(gemstring2,
			array_a2, array_b2, array_c2,
			array_d2, array_e2, array_f2,
			array_g2, minilist)
	end

	gemstring2 = gemstring
	array_a2 = array_a.clone
	array_b2 = array_b.clone
	array_c2 = array_c.clone
	array_d2 = array_d.clone
	array_e2 = array_e.clone
	array_f2 = array_f.clone
	array_g2 = array_g.clone

	if array_d2.length > 0
		gemstring2 = gemstring2 + array_d2.pop
		make_gemstring(gemstring2,
			array_a2, array_b2, array_c2,
			array_d2, array_e2, array_f2,
			array_g2, minilist)
	end

	
	gemstring2 = gemstring
	array_a2 = array_a.clone
	array_b2 = array_b.clone
	array_c2 = array_c.clone
	array_d2 = array_d.clone
	array_e2 = array_e.clone
	array_f2 = array_f.clone
	array_g2 = array_g.clone
	
	if array_e2.length > 0
		gemstring2 = gemstring2 + array_e2.pop
		make_gemstring(gemstring2,
			array_a2, array_b2, array_c2,
			array_d2, array_e2, array_f2,
			array_g2, minilist)
	end

	gemstring2 = gemstring
	array_a2 = array_a.clone
	array_b2 = array_b.clone
	array_c2 = array_c.clone
	array_d2 = array_d.clone
	array_e2 = array_e.clone
	array_f2 = array_f.clone
	array_g2 = array_g.clone
	
	if array_f2.length > 0
		gemstring2 = gemstring2 + array_f2.pop
		make_gemstring(gemstring2,
			array_a2, array_b2, array_c2,
			array_d2, array_e2, array_f2,
			array_g2, minilist)
	end

	gemstring2 = gemstring
	array_a2 = array_a.clone
	array_b2 = array_b.clone
	array_c2 = array_c.clone
	array_d2 = array_d.clone
	array_e2 = array_e.clone
	array_f2 = array_f.clone
	array_g2 = array_g.clone
	
	if array_g2.length > 0
		gemstring2 = gemstring2 + array_g2.pop
		make_gemstring(gemstring2,
			array_a2, array_b2, array_c2,
			array_d2, array_e2, array_f2,
			array_g2, minilist)
	end
		
end

array_a = ["a"]
array_b = ["b", "b", "b", "b"]
array_c = ["c"]
array_d = ["d", "d", "d", "d"]
array_e = ["e", "e"]
array_f = ["f"]
array_g = ["g", "g", "g"]

=begin
array_a = ["a"]
array_b = ["b"]
array_c = ["c"]
array_d = ["d"]
array_e = ["e", "e"]
array_f = ["f"]
array_g = ["g"]
=end

gemstring = ""
minilist = [0]
make_gemstring(gemstring,
		array_a, array_b, array_c,
		array_d, array_e, array_f,
		array_g, minilist)
# p minilist
# p minilist.sort
p minilist.size

# 8進数を宝石パターンに変換する
def convert_gemstring( oct_string )
	gems = ['0', 'a', 'b', 'c', 'd', 'e', 'f', 'g']
#	gem_array = []
	for i in (0..oct_string.length-1) do
		oct_string.gsub!(/[01234567]/) { |s| gems[s.to_i] }
	end
	
	return oct_string
end

def check_gemstring( gemstring, gemnum )

	for c in ['a', 'b', 'c', 'd', 'e', 'f', 'g'] do
#		print gemstring[i]
#		if gemstring.count(c) > gemnum[ - 1 
	end
	
	p gemnum
	return true
end

def check_oct_string( oct_string, org_gemnum )

	gemnum = org_gemnum.clone

	for i in (0..oct_string.length-1) do
#		print gemstring[i]
		gemnum[oct_string[i].to_i] = gemnum[oct_string[i].to_i] - 1
		if gemnum[oct_string[i].to_i] < 0
			return false
		end
	end
#	p gemnum
	return true
end

#p convert_gemstring( 8 )
=begin
gemnum = [	"a" => 1,
			"b" => 4,
			"c" => 1,
			"d" => 4,
			"e" => 2,
			"f" => 1,
			"g" => 3
			]
gemnum = [ 0, 1, 4, 1, 4, 2, 1, 3]
minilist = []

princess = "eagcdfbe"
#princess = "ea"

i = 1
loop do
	oct_string = sprintf("%o", i)
#	gemstring = convert_gemstring( oct_string )
#	p gemstring
	if !oct_string.include?('0') && check_oct_string( oct_string, gemnum )
#		p oct_string
		gemstring = convert_gemstring( oct_string )
		minilist << gemstring
		if gemstring.length > 16
			break
		end
	end
	if !gemstring.include?('0') && check_gemstring( gemstring, gemnum )
		p gemstring
		minilist << gemstring
	end
	if i % 10000000 == 0
		p i
	end
	
	i = i + 1
end
#p minilist

p minilist.sort.index(princess)
#p minilist.length
=end
