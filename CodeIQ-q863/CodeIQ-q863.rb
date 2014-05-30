# The Essence of Programming  結城 浩さんからのアルゴリズムの問題
# チケットゴブル社の旅行プランを作れ！
# https://codeiq.jp/ace/yuki_hiroshi/q863

# 旅行プランで滞在する国名
country = [
	# 1/1～1/25
	"Kiribati",
	"Sudan",
	"China",
	"Haiti",
	# 1/27～2/12
	"Zambia",
	"Italy",
	# 2/13～3/9
	"Oman",
	"Finland",
	"Denmark",
	"Uzbekistan",
	"Burundi",
	# 3/15～3/22
	"Tuvalu",
	# 3/25～4/21
	"Tokelau",
	"Liechtenstein",
	"Macao",
	"Guam",
	"Afghanistan",
	"Libya",
	# 4/28～5/13
	"Niger",
	"Mongolia",
	# 5/14～5/24
	"Niue",
	# 5/27～5/31
	"Portugal",
	# 6/3～6/18
	"Antarctica",
	"Rwanda",
	"Narnia",
	"Palau",
	"Slovakia",
	# 6/20～7/20
	"Serbia",
	"Morocco",
	"Samoa",
	"Romania",
	"Brazil",
	"Kuwait",
	# 7/21～8/11
	"Nigeria",
	"Martinique",
	"Ethiopia",
	"Montenegro",
	# 8/12～9/7
	"Seychelles",
	"Malta",
	"Poland",
	"Switzerland",
	"Barbados",
	# 9/8～10/2
	"Belarus",
	"Slovenia",
	"Malawi",
	"Gambia",
	"Nicaragua",
	# 10/6～10/20
	"Uganda",
	"Namibia",
	"Mauritania",
	# 10/22～11/25
	"Somalia",
	"Zimbabwe",
	"Ghana",
	"Malaysia",
	"Senegal",
	"Botswana",
	# 11/27～12/28
	"Greece",
	"Chad",
	"Egypt",
	"Ecuador",
	"Montserrat",
	"Dominica",
]

# 
print "#{country.size} "
country.sort.each do |c|
	print "#{c} "
end

exit

#
#
#
require 'date'

=begin
#
# 日付のテスト
#
start_day = Date.new(2014, 5, 31)
end_day = Date.new(2014, 6, 15)
(start_day..end_day).each do |day|
	puts day
end
=end



# チケットデータの読み込み
tickets = []
File.open("tickets.txt") do |f|
	# puts f.read
	# puts f.read.split(' ')
	while l = f.gets
		tickets << l.chop.split(/ |-/)
	end
end

# p tickets

h = {}
start_date = Date.new(2000, 1, 1)
end_date = Date.new(2000, 12, 31)
(start_date..end_date).each do |day|
	h[day.month.to_s + "/" + day.day.to_s] = []
end

tickets.each do |ticket|
	start_month, start_day = ticket[1].split('/')
#	p start_day.to_i
	start_date = Date.new(2000, start_month.to_i, start_day.to_i)
#	print "#{start_month}/#{start_day}\n"
	end_month, end_day = ticket[2].split('/')
	end_date = Date.new(2000, end_month.to_i, end_day.to_i)
	(start_date..end_date).each do |day|
		h[day.month.to_s + "/" + day.day.to_s] << ticket[0]
	end
	
end

File.open("schedule.csv", "w") do |f|
h.each do |key, value|
	print "#{key} "
	value.each do |country|
		print "#{country} "
	end
	print "\n"
	
	f.write key
	f.write ","
	value.each do |country|
		f.write country
		f.write ","
	end
	f.write "\n"
	
end
end
