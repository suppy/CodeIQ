# coding : utf-8
require 'date'
birthday = '2012-06-18'
祝★ = ''
CodeIQ = 'CoooooooooooooooooooooooooooooodeIQ '.squeeze
birthday = Date.parse(birthday)
today = Date.today
３ = today.year - birthday.year
exit if ３ < 0
３ -= 1 if Date.new(birthday.year, today.month, today.day) < birthday
diff = today - Date.new(today.year, birthday.month, birthday.day)
祝★ = '祝★' if diff >= 0 && diff < 14
print "#{祝★}#{CodeIQ}#{３}周年"
