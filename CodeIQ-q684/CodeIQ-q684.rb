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
=end
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

=begin
	if !gemstring.include?('0') && check_gemstring( gemstring, gemnum )
		p gemstring
		minilist << gemstring
	end
=end
	if i % 10000000 == 0
		p i
	end
	
	i = i + 1
end
#p minilist

p minilist.sort.index(princess)
#p minilist.length
