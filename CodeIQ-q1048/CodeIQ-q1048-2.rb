# coding: utf-8
# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：面倒なキャッチボール
# https://codeiq.jp/ace/thisweek_masuipeo/q1048


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 学生が持っているボールの番号を格納した配列
# ボールを持っていない学生は0を格納する
students = (0..11).to_a << 0
#students = (0..12).to_a
#students[5] = 0

p students

# 終了条件
def finished(students)
	(2...12).each do |i|
		if students[i] != i
			return false
		end
	end
	return false if students[12] != 1
	return true
end

# p finished(students)


# 学生とボールの組み合わせの集合
# 初期値
students_set = [students]
p students_set

students_set_exist = [students]

count = 0

loop do
	count += 1
	p count
	students_set_next = []
	# 学生とボールの組み合わせのそれぞれについて処理を行う
	students_set.each do |students|
		#p students
		#p students.rindex(0)
		# ボールを持っていない学生を見つける
		student_no = students.rindex(0)
		# 7～12の学生のとき
		if student_no >= 7
			# 投げられる相手（３人）とキャッチボールをする
			(student_no-7..student_no-5).each do |i|
				next if i < 1
				next if student_no == 12 and i == 7
				students_next = students.clone
				students_next[student_no] = students_next[i]
				students_next[i] = 0
				# 終了条件の判定
				if finished(students_next)
					p count
					exit
				end
#				students_set_next << students_next if !students_set_next.include?(students_next)
				students_set_next = students_set_next | [students_next]
			end
		# 1～6の学生のとき
		else
			# 投げられる相手（３人）とキャッチボールをする
			(student_no+5..student_no+7).each do |i|
				next if i >12
				next if student_no == 1 and i == 6
				students_next = students.clone
				students_next[student_no] = students_next[i]
				students_next[i] = 0
				if finished(students_next)
					p count
					exit
				end
#				students_set_next << students_next if !students_set_next.include?(students_next)
				students_set_next = students_set_next | [students_next]
			end
		end
		#p students_set
	end
	#p students_set_next
	p students_set_next.length
	#students_set = students_set_next.uniq
	students_set = students_set_next - students_set_exist
	students_set_exist << students_set_next
	p students_set.length
	#p students_set
end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
