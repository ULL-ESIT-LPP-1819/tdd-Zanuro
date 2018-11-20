class Datos
  attr_accessor :peso, :altura, :edad, :cintura, :cadera
  attr_reader  :sexo
  def initialize(peso,altura,sexo,edad,cintura,cadera)
    @peso = Float(peso)
    @altura = Float(altura)
    @sexo  = String(sexo)  #0 para mujeres y 1 para hombres
    @edad = Integer(edad)
    @cintura = Float(cintura)
    @cadera = Float(cadera)
  end
  def imc
    #puts "Indice de masa corporal es: #{Float((a/(b**2))*(10**4)).round(2)}"
    Float((@peso/(@altura**2))*(10**4)).round(2)
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
  def ficha_datos
    "----Ficha valoracion nutricional-----"
    return "Sexo:#{@sexo}"
    return "Edad:#{@edad}"
    return "Peso:#{@peso}"
    return "Altura:#{@altura}"
    return "Indice masa corporal:#{self.imc}"
    return "Porcentaje de grasa corporal:#{self.porcentaje_grasa}"
    return "Circunferencia cintura cadera:#{self.cint_cad}"
    return "Clasif.OMS:#{self.clasf_oms}"
    return "Clasif.RCC:#{self.clasf_rcc}"
  end
  def clasf_oms
    #puts "Clasificacion OMS"
    case self.imc
    when self.imc < 18.5
      #puts "Bajo peso"
      return "Delgado"
    when 18.5..24.9
      #puts "Adecuado"
      return "Aceptable"
    when 25.0..29.9
      #puts "Sobrepeso"
      return "Sobrepeso"
    when 30.0..34.9
      return "Obesidad grado 1"
      #return "Obesidad"
    when 35.0..39.9
      return "Obesidad grado 2"
      #return "Obesidad"
    when self.imc > 40
      return "Obesidad grado 3"
      #return "Obesidad"
    end

  end
  def cint_cad
    Float(@cintura/@cadera).round(2)
  end

  def clasf_rcc
    if @sexo == "hombre"
      case self.cint_cad
      when 0.83...0.88
        return "Riesgo bajo"
      when 0.88...0.95
        return "Riesgo moderado"
      when 0.95..1.00
        return "Riesgo alto"
      when self.cint_cad > 1.00
        return "Riesgo muy alto"
      end
    elsif @sexo == "mujer"
      case self.cint_cad
      when 0.72...0.78
        return "Riesgo bajo"
      when 0.78..0.82
        return "Riesgo moderado"
      when self.cint_cad > 0.82
        return "Riesgo alto"
      end
    end
  end

end

