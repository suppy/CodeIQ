# @masuidrive  増井 雄一郎さんからの論理演算の問題
# 七夕にtrick or trick?
# https://codeiq.jp/ace/masui_yuichiro/q960

operator = ["AND", "OR", "XOR", "NAND", "NOR"]

def calc(param1, ope, param2)
	case ope
	when "AND"
		return param1 && param2
	when "OR"
		return param1 || param2
	when "XOR"
		return (!param1 && param2) || (param1 && !param2)
	when "NAND"
		return !(param1 && param2)
	when "NOR"
		return !(param1 || param2)
	end
end

expected_state = [[false, false, true],
					[true, false, false],
					[false, true, true],
					[true, true, false]]
					
operator.repeated_permutation(3).each do |ope|
	correct = true
	expected_state.each do |state|
		#p state
		trick = state[0]
		treat = state[1]
		answer = calc(calc(calc(trick, ope[0], treat), "OR", treat), ope[1], calc(trick, ope[2], treat))
		#print "#{trick} #{treat} #{state[2]}:#{answer}\n"
		if state[2] != answer
			correct = false
			break
		end
	end
	next if !correct
	p ope
	#break
end
