require "Etiqueta/version"

class Tag
  
  include Comparable
  attr_accessor :grasas_mono_insaturadas, :grasas_poliinsaturadas, :polialcoholes, :almidon, :vitaminas, :minerales
  attr_reader :nombre_etiqueta, :grasas, :grasas_saturadas, :hidratos, :azucares, :proteinas, :sal, :lipidos, :fibra_alim, :energia, :dividido

  def initialize(nombre_etiqueta,grasas,grasas_saturadas,hidratos,azucares,proteinas,sal,lipidos,fibra_alim,dividido)
    @nombre_etiqueta = String(nombre_etiqueta)
    @grasas = Float(grasas)
    @grasas_saturadas = Float(grasas_saturadas)
    @hidratos = Float(hidratos)
    @azucares = Float(azucares)
    @proteinas = Float(proteinas)
    @sal = Float(sal)
    @dividido = String(dividido)        # 'T' para verdadero  'F' para falso
    @lipidos = Float(lipidos)
    @fibra_alim = Float(fibra_alim)
    @grasas_mono_insaturadas = 0
    @grasas_poliinsaturadas = 0
    @polialcoholes = 0
    @almidon = 0
    @vitaminas = 0
    @minerales = 0

  end

  def <=> otro
      suma_kcal <=> otro.suma_kcal
  end
  
  def +(otro)
      return self.suma_kcal+otro.suma_kcal
  end 
  def obtener_nombre
   # puts "El nombre de la etiqueta es: #{@nombre_etiqueta}"
    @nombre_etiqueta
  end 
  def suma_valores
    @grasas+@hidratos+@azucares+@proteinas+@sal+@fibra_alim+@lipidos
  end
  def suma_kcal
    self.grasa_kcal_g + self.hidratos_kcal_g+self.fibra_kcal_g+self.proteinas_kcal_g+self.sal_kcal_g+self.azucar_kcal_g+self.lipidos_kcal_g
  end

  def grasa_kcal_g
    (@grasas*9).round(1)
  end
  def hidratos_kcal_g
   (@hidratos*4).round(1)
  end
  def fibra_kcal_g
    (@fibra_alim*2).round(1)
  end
  def proteinas_kcal_g
    (@proteinas*4).round(1)
  end
  def sal_kcal_g
    (@sal*6).round(1)
  end
  def azucar_kcal_g
    (@azucares*4).round(1)
  end
  def lipidos_kcal_g
    (@lipidos*7).round(1)
  end
end

