class Datos
  attr_accessor :peso, :altura, :edad, :cintura, :cadera
  attr_reader  :sexo
  def initialize(peso,altura,sexo,edad,cintura,cadera)
    @peso = peso
    @altura = altura
    @sexo  = sexo  #0 para mujeres y 1 para hombres
    @edad = edad
    @cintura = cintura
    @cadera = cadera
  end
  def porcentaje_grasa
    if @sexo == "hombre"
      Float(1.2*self.imc+0.23*@edad-10.8*1-5.4).round(2)
      #puts "El indice de grasa del hombre es de: #{var}%"
    elsif @sexo == "mujer"
      Float(1.2*self.imc+0.23*@edad-10.8*0-5.4).round(2)
      #puts "El indice de grasa de la mujer es de: #{var}%"
    end
  end 
end

