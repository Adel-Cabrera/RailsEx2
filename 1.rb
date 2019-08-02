class Table

  #attr_accessor :name, :money

  def initialize(name, *money)
    @name = name
    @money = money.map(&:to_i)
  end

  def mas_alto()
    #return @money.select { |mesa| mesa} # Debe dar Mesa 4, día 2, valor 93
    max = @money.max
    nombre = @name
    return "#{nombre}, recaudación máxima de #{max}, día #{@money.index(max)+1}."

  end

  def promedio()
   # return @money.inject(&:+) / @money.size.to_f
   return @money.sum / @money.size.to_f
  end

end

new_list = []
data = []

File.open('casino.txt', 'r') { |file| data = file.readlines}

data.each do |lineas|
  line = lineas.split(', ') #String a Array
  myArray = Table.new(*line) # Instanciar objeto con argumentos
  new_list << myArray
end

#max = new_list.map() {|instancia| instancia.mas_alto}
max = new_list.map(&:mas_alto)
puts max

averages = new_list.map(&:promedio)
puts averages.inject(:+) / averages.size
