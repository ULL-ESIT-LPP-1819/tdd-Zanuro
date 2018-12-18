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

  def <=>(otro)
      suma_kcal <=> otro.suma_kcal
  end

  def obtener_nombre
   # puts "El nombre de la etiqueta es: #{@nombre_etiqueta}"
    @nombre_etiqueta
  end
  def obtener_grasas
    puts "La cantidad de grasas es: #{@grasas}"
    @grasas
  end
  def obtener_grasas_sat
    puts "La cantidad de grasas saturadas es: #{@grasas_saturadas}"
    @grasas_saturadas
  end
  def obtener_hidratos
    puts "La cantidad de hidratos es: #{@hidratos}"
    @hidratos
  end
  def obtener_azucares
    puts "La cantidad de azucares es: #{@azucares}"
    @azucares
  end 
  def obtener_proteinas
    puts "La cantidad de proteinas es: #{@proteinas}"
    @proteinas
  end
  def obtener_sal
    puts "La cantidad de sal es: #{sal}"
    @sal
  end
  def obtener_lipidos
    @lipidos
  end
  def obtener_fibra
    @fibra_alim
  end
  def porciones
    if @dividido == "T"
      a=6
      a=a.to_f
      puts "El paquete se encuentra dividido en: #{a} porciones"
      puts "Cada paquete tiene un tamaño de #{self.suma_valores}"
      puts "Cada paquete contendra lo siguiente:"
      puts "#{@grasas} grasas, #{@grasas_saturadas/a} grasas saturadas,#{@hidratos/a} hidratos, #{@azucares/a} azucares,
      #{@proteinas/a} proteinas, #{@sal/a} sal"
      if @grasas_mono_insaturadas > 0
        puts "El paquete tambien contiene : #{@grasas_mono_insaturadas/a}"
      end
      if @grasas_poliinsaturadas > 0
        puts "El paquete tambien contiene : #{@grasas_poliinsaturadas/a}"
      end
      if @polialcoholes > 0
        puts "El paquete tambien contiene : #{@polialcoholes/a}"
      end
      if fibra_alim > 0
        puts "El paquete tambien contiene: #{@fibra_alim/a}"
      end
      if vitaminas > 0
        puts "El paquete contiene:  #{@vitaminas/a}"
      end

      if minerales > 0
        puts "El paquete contiene #{@minerales/a}"
      end
      return a
    else
      puts "El paquete no se encuentra dividido en paquetes"
      puts "Unico paquete de tamaño #{self.suma_valores}"
      return 1
    end
    end

  
  def suma_valores
    @grasas+@hidratos+@azucares+@proteinas+@sal+@fibra_alim+@lipidos
  end

  def suma_kj
    self.grasa_kj_g + self.monoins_kj_g+self.poli_kj_g+self.hidratos_kj_g+self.polialcoles_kj_g+self.almidon_kj_g+self.fibra_kj_g+self.proteinas_kj_g+self.sal_kj_g
  end

  def suma_kcal
    self.grasa_kcal_g + self.hidratos_kcal_g+self.fibra_kcal_g+self.proteinas_kcal_g+self.sal_kcal_g+self.azucar_kcal_g+self.lipidos_kcal_g
  end

  def ingesta_referencia(valor)
    ((valor*100)/self.suma_valores).round(2)

  end

  def grasa_kj_g
   (@grasas*37).round(1)
  end
  def monoins_kj_g
    (@grasas_mono_insaturadas*37).round(1)
  end
  def poli_kj_g
   (@grasas_poliinsaturadas*37).round(1)
  end
  def hidratos_kj_g
    (@hidratos*17).round(1)
  end
  def polialcoles_kj_g
    (@polialcoholes*10).round(1)
  end
  def almidon_kj_g
    (@almidon*17).round(1)
  end
  def fibra_kj_g
    (@fibra_alim*8).round(1)
  end
  def proteinas_kj_g
    (@proteinas*17).round(1)
  end
  def sal_kj_g
    (@sal*25).round(1)
  end
  def grasa_kcal_g
    (@grasas*9).round(1)
  end
  def monoins_kcal_g
    (@grasas_mono_insaturadas*9).round(1)
  end
  def poli_kcal_g
    (@grasas_poliinsaturadas*9).round(1)
  end
  def hidratos_kcal_g
   (@hidratos*4).round(1)
  end
  def polialcoles_kcal_g
    (@polialcoholes*2.4).round(1)
  end
  def almidon_kcal_g
    (@almidon*4).round(1)
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

  def imprimir_etiqueta
     if @dividido == "T"
        puts "     Por 100g o 100ml de producto   IR(por 100g o 100ml)   Por porcion de #{self.suma_valores/self.porciones}   IR(por porcion de #{self.suma_valores/self.porciones})"
        puts "Val. ener:#{self.suma_kj} kJ,#{self.suma_kcal} kcal ,#{self.ingesta_referencia(self.suma_kj)} %,#{self.suma_kj/self.porciones}, #{self.ingesta_referencia(self.suma_kj)/self.porciones} Recomendado: 8400 kJ/ 2000kcal"
        puts "Grasas: #{@grasas} g, #{self.ingesta_referencia(@grasas)} %, #{@grasas/self.porciones} g, #{self.ingesta_referencia(@grasas)/self.porciones} %"
        puts "Saturadas: #{@grasas_saturadas} g, #{self.ingesta_referencia(@grasas_saturadas)} %, #{@grasas_saturadas/self.porciones} g, #{self.ingesta_referencia(@grasas_saturadas)/self.porciones} %"
        puts "Monoinsaturadas: #{@grasas_mono_insaturadas} g, 0 %, #{@grasas_mono_insaturadas/self.porciones} g, 0%"
        puts "Poliinsaturados: #{@grasas_poliinsaturadas} g, 0%, #{@grasas_poliinsaturadas/self.porciones} g, 0%"
        puts "Hidratos: #{@hidratos} g, #{self.ingesta_referencia(@hidratos)} %, #{@hidratos/self.porciones} g, #{self.ingesta_referencia(@hidratos)/self.porciones} %"
        puts "Azucares: #{@azucares} g, #{self.ingesta_referencia(@azucares)} %, #{@azucares/self.porciones} g, #{self.ingesta_referencia(@azucares)/self.porciones} %"
        puts "Polialcoholes: #{@polialcoholes} g, 0%, #{@polialcoholes/self.porciones} g, 0%"
        puts "Almidon: #{@almidon} g, 0%, #{@almidon/self.porciones} g, 0%"
        puts "Fibra alim: #{@fibra_alim} g, 0%, #{@fibra_alim/self.porciones} g, 0%"
        puts "Proteinas: #{@proteinas} g, #{self.ingesta_referencia(@proteinas)} %, #{@proteinas/self.porciones} g, #{self.ingesta_referencia(@proteinas)/self.porciones} %"
        puts "Sal: #{@sal} g, #{self.ingesta_referencia(@sal)} %, #{@sal/self.porciones} g, #{self.ingesta_referencia(@sal)/self.porciones} %"
     elsif @dividido == "F"
	puts "     Por 100g o 100ml de producto   IR(por 100g o 100ml) "
        puts "Val. ener:#{self.suma_kj} kJ,#{self.suma_kcal} kcal ,#{self.ingesta_referencia(self.suma_kj)} %, Recomendado: 8400 kJ/ 2000kcal"
        puts "Grasas: #{@grasas} g, #{self.ingesta_referencia(@grasas)} % " 
        puts "Saturadas: #{@grasas_saturadas} g, #{self.ingesta_referencia(@grasas_saturadas)} %, "
        puts "Monoinsaturadas: #{@grasas_mono_insaturadas} g, 0% "
        puts "Poliinsaturados: #{@grasas_poliinsaturadas} g,  0% "
        puts "Hidratos: #{@hidratos} g, #{self.ingesta_referencia(@hidratos)} %"
        puts "Azucares: #{@azucares} g, #{self.ingesta_referencia(@azucares)} %"
        puts "Polialcoholes: #{@polialcoholes} g, 0%"
        puts "Almidon: #{@almidon} g, 0%"
        puts "Fibra alim: #{@fibra_alim} g, 0%"
        puts "Proteinas: #{@proteinas} g, #{self.ingesta_referencia(@proteinas)} %"
        puts "Sal: #{@sal} g, #{self.ingesta_referencia(@sal)} %"

      end
  end

  def valores_opt
    puts "Valor energetico recomendable: 8400 kJ/ 2000 kcal/g vs valor energetico del producto: #{self.suma_kj} kJ, #{self.suma_kcal} kcal"
    puts "Grasas totales recomendables: 70g vs grasas del producto: #{@grasas} g"
    puts "Acidos grasos saturados(grasas saturadas) recomendables: 20g vs acidos grasos saturados del producto: #{@grasas_saturadas} g"
    puts "Hidratos de carbono recomendables:260g vs hidratos de carbono del producto #{@hidratos} g"
    puts "Azucares recomendables: 90g vs azucares del producto #{@azucares} g"
    puts "Proteinas recomendables: 50g vs proteinas del producto #{@proteinas} g"
    puts "Sal recomendable: 6g vs sal del producto #{@sal}"
  end

end

