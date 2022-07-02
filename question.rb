class Question
  attr_reader :q

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @q = "What does #{@number1} plus #{@number2} equal?"
  end

  def is_correct(answer)
    correct = @number1 + @number2
    answer.to_i == correct ? true : false
  end
end