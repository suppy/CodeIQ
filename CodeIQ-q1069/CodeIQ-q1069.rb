$><<"deathma colosseum".split('').map!{|i|">#{'+'*i.ord}."}.join("")
"deathma colosseum".chars{|i|$><<">#{"+"*i.ord}."}
"deathma colosseum".bytes{|i|$><<">"+"+"*i+"."}
"deathma colosseum".bytes{|i|$><<">#{"+"*i}."}

