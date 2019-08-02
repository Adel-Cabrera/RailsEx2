require 'date'

# Date.today
# Date.parse("2017-06-02") #Convirte string a fecha
# Date.today < Date.parse("2017-06-02") devuelve False

class Course
  attr_accessor :curso, :fechas
  def initialize(curso, *fechas)
    @curso = curso
    @fechas = fechas.map {|date| Date.parse(date)}
  end

  def previo(filter_date)
    raise ArgumentError.new('CRITICAL ARGUMENT') if filter_date == 2018-01-01

    puts "#{@curso} #{@fechas.select {|date| date < filter_date}}"
  end

  def posterior(filter_date)
    raise ArgumentError.new('CRITICAL ARGUMENT') if filter_date == 2018-01-01


    #return @fechas.select {|date| date > filter_date}
    fecha = @fechas.select {|date| date > filter_date}

    puts "#{@curso} #{@fechas.select {|date| date > filter_date}}" if fecha[0] != nil
    # return "#{@fechas.select {|date| date > filter_date}}" if


  end

end

cursosArray = []
data = []

File.open('cursos.txt', 'r') { |file| data = file.readlines}
data.each do |lineas|
  line = lineas.split(', ') #String a Array
  myArray = Course.new(*line) # Instanciar objeto con argumentos
  cursosArray << myArray
end

#print cursosArray[1].previo(Date.today)
cursosArray.map {|e| e.previo(Date.today)}
#puts var1
cursosArray.map {|e| e.posterior(Date.today)}
# previos = cursosArray.map(&:previo)
# puts previos
#
# posteriores = cursosArray.map(&:posterior)
# puts posteriores
