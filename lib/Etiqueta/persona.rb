require './datos.rb'

class Individuo
  attr_accessor :nombre

  def initialize(nombre)
    @nombre = nombre
  end
  def to_s
    "( #{nombre} "
  end
end

class Paciente < Individuo
  attr_accessor :data

  def initialize(nombre,peso,altura,sexo,edad,cintura,cadera)
    super(nombre)
    @data= Datos.new(peso,altura,sexo,edad,cintura,cadera)
  end

  def to_s
    s << super.to_s
    s << ", #{data})"
    s
  end

  def get_data
     @data
end

