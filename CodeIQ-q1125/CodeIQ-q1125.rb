# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：友達の友達は友達？
# https://codeiq.jp/ace/thisweek_masuipeo/q1125


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

require 'prime'


# 素因数を求める
def prime_factor(number)
  return Prime.prime_division(number).map{|factor| factor[0]}
end

# 友だちを求める
def find_friends(member, persons)
  #p persons
  friends = [] 
  persons.each do |person|
    friends << person if (prime_factor(person) & prime_factor(member)).length > 0
  end
  return friends
end

n = 49
# 合成数を求める
composite_num = (2..n).to_a
Prime.each(n) do |prime|
  composite_num.delete(prime)
end

p composite_num

exit


m = 3
composite_num_subset = composite_num.combination(m).to_a
#p composite_num_subset[0]
max_step = 0
#composite_num_subset[0].each do |member|
composite_num.each do |member|
  #member = 6
  print "start member:#{member}\n"
  member_sets = []

  friends = find_friends(member, composite_num - [member])
  if (composite_num - [member] - friends).length != 0
    member_sets << [member, friends, composite_num - [member] - friends]
  end
  p member_sets
  step = 1
  print "step#{step}\n"
  next if member_sets.length == 0
  loop do
    next_member_sets = []
    member_sets.each do |member_set|
      #member = member_set[0]
      members = member_set[1]
      not_friends = member_set[2]
      print "not_friends #{not_friends}\n"
      if not_friends.length == 0
        next_member_sets = []
        break 
      end
      members.each do |member|
        friends = find_friends(member, members - [member] + not_friends)
        print "#{member} -> #{friends} #{members - [member] - friends}\n"
        if (members - [member] + not_friends - friends).length != 0
          next_member_sets << [member, friends, members - [member] + not_friends - friends]
        else
          break
        end
      end
    end
    p next_member_sets
    break if next_member_sets.length == 0
    member_sets = next_member_sets
    step += 1
    print "step#{step}\n"
  end
  print "#{member} step #{step}\n"
  max_step = step if max_step < step
end
p max_step

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
