emoji = "
;waxing_gibbous_moon;;full_moon_with_face;;waning_gibbous_moon;
;first_quarter_moon_with_face;;earth_asia;;last_quarter_moon_with_face;
;waxing_crescent_moon;;new_moon_with_face;;waning_crescent_moon;
"

puts emoji.strip.gsub(/;/, 58.chr)
