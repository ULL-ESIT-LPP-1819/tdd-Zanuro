require "Etiqueta/version"

class Tag

  attr_accessor :grasas_mono_insaturadas, :grasas_poliinsaturadas, :polialcoholes, :almidon, :fibra_alim, :vitaminas, :minerales
  attr_reader :nombre_etiqueta, :grasas, :grasas_saturadas, :hidratos, :azucares, :proteinas, :sal, :dividido

  def initialize(nombre_etiqueta,grasas,grasas_saturadas,hidratos,azucares,proteinas,sal,dividido)
    @nombre_etiqueta = String(nombre_etiqueta)
    @grasas = Float(grasas)
    @grasas_saturadas = Float(grasas_saturadas)
    @hidratos = Float(hidratos)
    @azucares = Float(azucares)
    @proteinas = Float(proteinas)
    @sal = Float(sal)
    @dividido = Char(dividido)        # 'T' para verdadero  'F' para falso
    @grasas_mono_insaturadas = 0
    @grasas_poliinsaturadas = 0
    @polialcoholes = 0
    @almidon = 0
    @fibra_alim = 0
    @vitaminas = 0
    @minerales = 0

  end

  def obtener_nombre
    puts "El nombre de la etiqueta es: #{@nombre_etiqueta}"
    @nombre_etiqueta
  end

  def porciones
    if @dividido == 'T'
      a = rand(1..10)
      puts "El paquete se encuentra dividido en: #{a} porciones"
      puts "Cada paquete tiene un tamaño de #{self.suma_valores}"
      puts "Cada paquete contendra lo siguiente:"
      puts "#{@grasas/a} grasas, #{@grasas_saturadas/a} grasas saturadas,#{@hidratos/a}, #{@azuraces/a} azucares,
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
    else
      puts "El paquete no se encuentra dividido en paquetes"
      puts "Unico paquete de tamaño #{self.suma_valores}"

    end
       return a
    end

  
  def suma_valores
    @grasas+@grasas_saturadas+@hidratos+@azucares+@proteinas+@sal
  end

  def suma_kj
    self.grasa_kj_g + self.monoins_kj_g+self.poli_kj_g+self.hidratos_kj_g+self.polialcoles_kj_g+self.almidon_kj_g+self.fibra_kj_g+self.proteinas_kj_g+self.sal_kj_g
  end

  def suma_kcal
    self.grasa_kcal_g + self.monoins_kcal_g+self.poli_kcal_g+self.hidratos_kcal_g+self.polialcoles_kcal_g+self.almidon_kcal_g+self.fibra_kcal_g+self.proteinas_kcal_g+self.sal_kcal_g
  end

  def ingesta_referencia(valor)
    (valor*100)/self.suma_valores

  end

  def grasa_kj_g
    @grasas*37
  end
  def monoins_kj_g
    @grasas_mono_insaturadas*37
  end
  def poli_kj_g
    @grasas_poliinsaturadas*37
  end
  def hidratos_kj_g
    @hidratos*17
  end
  def polialcoles_kj_g
    @polialcoholes*10
  end
  def almidon_kj_g
    @almidon*17
  end
  def fibra_kj_g
    @fibra_alim*8
  end
  def proteinas_kj_g
    @proteinas*17
  end
  def sal_kj_g
    @sal*25
  end
  def grasa_kcal_g
    @grasas*9
  end
  def monoins_kcal_g
    @grasas_mono_insaturadas*9
  end
  def poli_kcal_g
    @grasas_poliinsaturadas*9
  end
  def hidratos_kcal_g
    @hidratos*4
  end
  def polialcoles_kcal_g
    @polialcoholes*2.4
  end
  def almidon_kcal_g
    @almidon*4
  end
  def fibra_kcal_g
    @fibra_alim*2
  end
  def proteinas_kcal_g
    @proteinas*4
  end
  def sal_kcal_g
    @sal*6
  end

  def imprimir_etiqueta
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

