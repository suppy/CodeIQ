#coding:utf-8
require "bigdecimal/math"
include BigMath
 
(n=gets.to_i) and (c="codeiq").upcase.chars.map(&:ord).join("").tap{|s|
  puts s.chars.each_slice(s.size/Math::PI.to_i)
    .map{|t|t.join("")}
    .all?{|c|PI(n).to_s.include? c} ? "祝！#{c} #{Math::PI.to_i}周年" : "例のクラゲ"
}