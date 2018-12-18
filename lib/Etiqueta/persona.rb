class Individuo
  attr_accessor :nombre, :fac_activ

  def initialize(nombre,fac_activ)
    @nombre = nombre
    @fac_activ = fac_activ
  end
  def to_s
    "( #{nombre} , #{fac_activ} "
  end
end

class Paciente < Individuo
  include Comparable
  attr_accessor :data

  def initialize(nombre,peso,altura,sexo,edad,cintura,cadera,fac_activ)
    super(nombre,fac_activ)
    @data= Datos.new(peso,altura,sexo,edad,cintura,cadera)
  end

  def <=> otro
      gasto_energetico_total <=> otro.gasto_energetico_total
  end
  def to_s
    s << super.to_s
    s << ", #{data})"
    s
  end

  def get_data
     @data
  end
  def peso_teorico_ideal
      (@data.altura-150)*0.75+50
  end
 
  def gasto_energetico
    if @data.sexo == '1'   
	10*@data.peso+6.25*@data.altura-5*@data.edad-161
    elsif @data.sexo == '0'
    	10*@data.peso+6.25*@data.altura-5*@data.edad+5
    end
  end
  def efecto_termogeno
  	self.gasto_energetico*0.10
  end	
  def nivel_actividad
      puts "Nivel de actividad"
      case @fac_activ
      when "Reposo"
            0.0
      when "Actividad ligera"
            0.12
      when "Actividad moderada"
            0.27
      when "Actividad intensa"
	    0.54
      end
   end
   def gasto_actividad_fisica
	self.gasto_energetico*self.nivel_actividad
   end	
   def gasto_energetico_total
	self.gasto_energetico+self.efecto_termogeno+self.gasto_actividad_fisica
   end
end

