# coding: utf-8

class Bingo
  def self.generate_card
    # 以下の行は削除して、自分でロジックを実装してください。
    sample
  end

  def self.sample
    <<-CARD
 B |  I |  N |  G |  O
13 | 22 | 32 | 48 | 61
 3 | 23 | 43 | 53 | 63
 4 | 19 |    | 60 | 65
12 | 16 | 44 | 50 | 75
 2 | 28 | 33 | 56 | 68
    CARD
  end
end

describe Bingo do
  describe '#generate_card' do
    let(:card) { Bingo.generate_card }
    let(:rows) { card.split("\n") }
    let(:table) { rows.map { |s| s.split(' | ') } }
    let(:numbers_by_col) do
      table[1..-1]
          .map { |cols| cols.map(&:to_i) }
          .transpose
    end
    it '何らかのデータが出力されること' do
      # デバッグ用に出力結果をコンソール表示する
      puts '=' * 22
      puts card
      puts '=' * 22
      expect(card.size).to be > 1
    end
    it '6行になっていること' do
      expect(rows.size).to eq 6
    end
    it '1行は22文字になっていること' do
      expect(rows.all? { |s| s.size == 22 }).to be_truthy
    end
    it '列はパイプで区切られていること' do
      rows.each do |row|
        expect(row.split(' | ').size).to eq 5
      end
    end
    it '先頭行はBINGOになっていること' do
      expect(rows.first.scan(/\w/).join).to eq 'BINGO'
    end
    it 'カラムの値は右寄せになっていること' do
      table.flatten.each do |col|
        expect(col).to match /^( [\d\w ]|\d\d)$/
      end
    end
    it '1列目の値は1～15の数字のどれかになっていること' do
      expect(numbers_by_col[0].all? { |n| (1..15).include?(n) }).to be_truthy
    end
    it '2列目の値は16～30の数字のどれかになっていること' do
      expect(numbers_by_col[1].all? { |n| (16..30).include?(n) }).to be_truthy
    end
    it '3列目の値（真ん中以外）は31～45の数字のどれかになっていること' do
      [0, 1, 3, 4].each do |index|
        expect((31..45).include?(numbers_by_col[2][index])).to be_truthy
      end
    end
    it '3列目の真ん中はスペースになっていること' do
      expect(table[3][2]).to eq '  '
    end
    it '4列目の値は46～60の数字のどれかになっていること' do
      expect(numbers_by_col[3].all? { |n| (46..60).include?(n) }).to be_truthy
    end
    it '5列目の値は61～75の数字のどれかになっていること' do
      expect(numbers_by_col[4].all? { |n| (61..75).include?(n) }).to be_truthy
    end
    it 'どの値も重複しないこと' do
      expect(numbers_by_col.flatten.uniq).to eq numbers_by_col.flatten
    end
    it '毎回結果が変わること' do
      pending '独自のコードを実装したらこの行は削除してください'
      cards = 10.times.map { Bingo.generate_card }
      expect(cards.uniq).to eq cards
    end
  end
end
