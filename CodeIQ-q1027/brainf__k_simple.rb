class BrainF__k
  attr_reader :tables, :init_codes, :pointer
  TEN_INCREMENT = '+' * 10

  def initialize(char)
    char_code = char.ord
    repeat = char_code / 10
    rest = char_code % 10
    @tables = []
    @pointer = 0
    @init_codes = "#{TEN_INCREMENT}[>#{increment(repeat)}<-]>#{increment(rest)}"
    @tables[@pointer] = char_code
  end

  def increment(count = 1)
    @tables[@pointer] = 0 unless @tables[@pointer]
    @tables[@pointer] += count
    '+' * count
  end

  def decrement(count = 1)
    @tables[@pointer] -= count
    '-' * count
  end

  def diff(char_code)
    diff_of_code = char_code - @tables[@pointer]
    return '' if diff_of_code.zero?
    @tables[@pointer] += diff_of_code
    diff_of_code > 0 ? ('+' * diff_of_code) : ('-' * diff_of_code.abs)
  end

  def next_pointer(count = 1)
    @pointer += count
    '>' * count
  end

  def previous_pointer(count = 1)
    @pointer -= count
    '<' * count
  end

  def output(count = 1)
    '.' * count
  end
end

text = ARGV.first
first_word = text[0]
bf = BrainF__k.new(first_word)
codes = text.split('').map(&:ord).reduce(bf.init_codes) do |codes, char|
  codes += bf.diff(char)
  codes += bf.output(1)
  codes
end

print codes
