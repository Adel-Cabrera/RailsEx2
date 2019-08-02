class Roulette
  #attr_accessor :r, :random

  def initialize(choice)
    @choice = choice
    @r = (1..10).to_a #range to array

  end

  def play()

    @random = @r.sample
    @win = @choice == @random

    #puts "#{@random} random, #{@choice} elección."
  end

  def save()
    File.open('roulette_history.txt', 'a') do |file|
       file.puts @random
     end

    if @win
       File.open('winners.txt', 'a') do |file|
          file.puts @choice
        end
    end

  end

end

# var = Roulette.new()
# var.play(10)
# var.save()

var = Roulette.new(10)
var.play()
var.save()
