# �_����������
max_point = 0

blendlist = []

# �t�@�C�����炷�ׂĂ�blend��ǂݍ���
# blendlist�Ɋi�[����
open("blendlist.txt") {|file|
  while l = file.gets
    l.chop! # "\n" ����菜��
    spice = l.split(" ")
    blendlist.push([spice[0], spice[1]])
  end
}

# blendlist�Ɋ܂܂��spice�̐�
 p blendlist.flatten.uniq.sort.size

# ���ׂĂ�spice��spicelist�Ɋi�[����i�d���Ȃ��A�\�[�g�ς݁j
spicelist = blendlist.flatten.uniq.sort

n = 2 ** spicelist.size
p n
spice1 = []
n = 7
n.times do
  spice1 << spicelist.shift
end
p spice1
spicelist = spice1

spice = []
dish1 = []
for i in (0..n) do
  j = i
  spice = spicelist.sort
  spice1 = []
  while(j != 0) do
    if j % 2 == 1 then
      spice1.push(spice.shift)
    else
      spice.shift
    end
    print j%2
    j = j / 2|0
  end
  print "\n"
  p spice1.sort

  dish1 = []
  spice1.each do |spice|
    blendlist.each do |blend|
      if blend[0] == spice or blend[1] == spice then
        dish1 << blend
      end
    end
  end
  p dish1.size
  dish2 = blendlist - dish1
  spice2.each do |spice|
    dish2.delete_if { |blend| blend[0] == spice or blend[1] == spice  }
  end

end
exit

while(true) do

  dish1 = []
  dish2 = []
  point = 0

  # blendlist���V���b�t��
  blendlist_shuffle = blendlist.sort_by { rand }
  # p blendlist_shuffle

  # �I������blend�̌��𗐐��Őݒ�i1�`blend�̌�-1�j
  # �Q�M�ڂ��O�ɂȂ�Ȃ��悤�ɂ��邽�߁Ablend�̌�-1�܂�
  blend_num = rand(blendlist.size - 1) + 1
  # p blend_num

  # blendlist�̐擪��������������o��
  # �� �P�M�ڂ�blend
  1.upto(blend_num) do
    dish1.push(blendlist_shuffle.shift)
  end

  # p dish1
 
  # �P�M�ڂŎg�p����spice�i�d���Ȃ��A�\�[�g�ς݁j
  spice1 = dish1.flatten.uniq.sort

  # print "spice1:"
  # p spice1

  # �P�M�ڂŎg�p����spice���폜����
  # �� �Q�M�ڂŎg�p�ł���spice
  spice2 = spicelist - spice1

  # print "spice2:"
  # p spice2

  # �c����blendlist����g�p����spice��blend���폜����
  # �� �Q�M�ڂ�blend
  dish2 = blendlist_shuffle
  spice1.each do |spice|
    dish2.delete_if { |blend| (blend[0] === spice) || (blend[1] === spice) }
  end

  # print "dish1"
  # p dish1
  # print "dish2"
  # p dish2

  # �Q�Ԗڂ̎M��blend���O�������疳��
  next if dish2.size === 0

  # �_�����v�Z����
  point = dish1.size + dish2.size
  # print "point:"
  # p point

  # �_�����ő�l���ǂ����̔���
  if point > max_point then
    # �ő�l����������
    max_point = point
    print "max_point:"
    p max_point

    # blend�̐������������񓚂ɂ���
    if dish1.size > dish2.size then
      spice_ans = spice1
    else
      spice_ans = spice2
    end

    # �񓚂�spice���t�@�C���ɏ�������
    file = File.open("curry-result.txt",'w')
    spice_ans.each { |spice|
      file.print spice + " "
    }
    file.print "\n"
    # point�̍ő�l����������
    file.puts max_point
    file.close
  end

end
