RSpec.describe Etiqueta do
  
  before :each do
     @et1 = Tag.new("Pizza",40.3,20.2,25.8,8.1,7.2,8.0,5.2,5.4,"F")
     @et2 = Tag.new("Hamburguesa",52.2,33.1,18.9,5,5.5,7.1,6.2,5.1,"T")
     @et3 = Tag.new("Platano",27.2,16.1,20.8,12.1,10.1,2.5,9.1,18.2,"F")
     @et4 = Tag.new("Pan",8.5,4.9,35.1,8.1,7.9,5.8,6.2,28.4,"F")
     @et5 = Tag.new("Cereales",2,0.5,57,18,7,1,0,15,"F")
     @et6 = Tag.new("Arroz",2.9,0.54,69.3,1.4,10.3,0,6,10.1,"F")
     @et7 = Tag.new("Tarta",16.8,4.8,18.6,41.4,3,15,5.2,0,"F")	 
     
     @pac1 =  Paciente.new("Juan",72.3,182.3,'1',43,84.2,95.5,"Actividad intensa")
     @pac2 =  Paciente.new("Maria",62.2,167.2,'0',38,70.2,74,"Actividad ligera")
     @pac3 =  Paciente.new("Jose",97.3,178.2,'1',31,88,98.4,"Actividad moderada")
     @pac4 =  Paciente.new("Jesus",68.3,172.0,'1',18,75.3,85.3,"Actividad moderada")
     @pac5 =  Paciente.new("Ana",58.4,164.3,'0',21,66.2,74.3,"Reposo")
     @lista = ListaDoble.new(0)
     @pacientes = ListaDoble.new(0)
     @menu1 = ListaDoble.new(0)
     @menu2 = ListaDoble.new(0)
     @menu3 = ListaDoble.new(0)
     @menu4 = ListaDoble.new(0)
     @menu5 = ListaDoble.new(0)     
  end
 	 
  describe "insercion" do
    it "Se comprueba la insercion de los elementos" do
	@lista.add_at_final(@et1)
	#puts "#{@lista.get_tail} \n"
	expect(@lista.get_tail).equal?(Node)
	@lista.add_at_final(@et2)
	expect(@lista.get_tail.value.nombre_etiqueta).to eq("Hamburguesa")
	#puts "#{@lista.get_tail} \n"	
        @lista.add_at_final(@et3)
	expect(@lista.get_tail.value.nombre_etiqueta).to eq("Platano")
	#puts "#{@lista.get_tail} \n"
	@lista.add_at_final(@et4)
	expect(@lista.get_tail.value.nombre_etiqueta).to eq("Pan")
	#puts "#{@lista.get_tail} \n"
	@lista.add_at_final(@et5)
	expect(@lista.get_tail.value.nombre_etiqueta).to eq("Cereales")

    end 
  end

  describe "gasto energetico" do
	it "calculamos el gasto energetico de cada persona" do

	expect(@pac1.gasto_energetico_total).to eq(2437.655)
	expect(@pac2.gasto_energetico_total).to eq(1808.04)
	expect(@pac3.gasto_energetico_total.round(2)).to eq(2425.93)
	expect(@pac4.gasto_energetico_total).to eq(2064.59)
	expect(@pac5.gasto_energetico_total.round(2)).to eq(1661.96)
	end
  end

  describe "cantidad calorica de cada alimento" do
	it "calcular cantidad calorica" do
	expect(@et1.suma_kcal).to eq(622.3)
	expect(@et2.suma_kcal).to eq(683.6)
	expect(@et3.suma_kcal).to eq(531.9)
	expect(@et4.suma_kcal).to eq(415.9)
	expect(@et5.suma_kcal).to eq(382.0)
   	end
   end	
		
   describe "kcal en una lista" do
	it "guardamos las kcal de los alimentos" do
	@lista.add_at_final(@et1.suma_kcal)
	@lista.add_at_final(@et2.suma_kcal)
	@lista.add_at_final(@et3.suma_kcal)
	@lista.add_at_final(@et4.suma_kcal)
	@lista.add_at_final(@et5.suma_kcal)
	expect(@lista.collect { |x| x.round(1)}).to eq([622.3,683.6,531.9,415.9,382.0])
	expect(@lista.reduce(:+).round(1)).to eq(2635.7)
   	end
   end

   describe "kcal menu <-> gasto persona" do
	it " comparamos los kcal del menu con el gasto energetico de los pacientes" do
	@menu1.add_at_final(@et1.suma_kcal)
	@menu1.add_at_final(@et2.suma_kcal)
	@menu1.add_at_final(@et3.suma_kcal)
	@menu1.add_at_final(@et4.suma_kcal)
	@menu1.add_at_final(@et5.suma_kcal)

	expect(@menu1.collect { |x| x.round(2)}).to eq([622.3,683.6,531.9,415.9,382.0])
	expect(@menu1.reduce(:+).round(1)).to eq(2635.7)
	expect(@pac1.gasto_energetico_total).to eq(2437.655)

	expect(@menu1.reduce(:+).between?((@pac1.gasto_energetico_total*0.90),(@pac1.gasto_energetico_total*1.10))).to eq(true)
	expect(@menu1.reduce(:+).between?((@pac2.gasto_energetico_total*0.90),(@pac2.gasto_energetico_total*1.10))).to eq(false)
  	expect(@menu1.reduce(:+).between?((@pac3.gasto_energetico_total*0.90),(@pac3.gasto_energetico_total*1.10))).to eq(true)
	expect(@menu1.reduce(:+).between?((@pac4.gasto_energetico_total*0.90),(@pac4.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu1.reduce(:+).between?((@pac5.gasto_energetico_total*0.90),(@pac5.gasto_energetico_total*1.10))).to eq(false)
	
	@menu2.add_at_final(@et6.suma_kcal)
	@menu2.add_at_final(@et7.suma_kcal)
	@menu2.add_at_final(@et4.suma_kcal)
	@menu2.add_at_final(@et1.suma_kcal)
	@menu2.add_at_final(@et3.suma_kcal)

	#a=@menu1.zip(@menu2)
	#puts a[0]
	#puts a[1]
	expect(@menu2.collect { |x| x.round(2)}).to eq([412.3,529.6,415.9,622.3,531.9])
	expect(@menu2.reduce(:+).round(1)).to eq(2512.0)
	
	expect(@pac2.gasto_energetico_total).to eq(1808.04)
	expect(@menu2.reduce(:+).between?((@pac1.gasto_energetico_total*0.90),(@pac1.gasto_energetico_total*1.10))).to eq(true)
	expect(@menu2.reduce(:+).between?((@pac2.gasto_energetico_total*0.90),(@pac2.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu2.reduce(:+).between?((@pac3.gasto_energetico_total*0.90),(@pac3.gasto_energetico_total*1.10))).to eq(true)
	expect(@menu2.reduce(:+).between?((@pac4.gasto_energetico_total*0.90),(@pac4.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu2.reduce(:+).between?((@pac5.gasto_energetico_total*0.90),(@pac5.gasto_energetico_total*1.10))).to eq(false)
	
	@menu3.add_at_final(@et4.suma_kcal)
	@menu3.add_at_final(@et2.suma_kcal)
	@menu3.add_at_final(@et7.suma_kcal)
	@menu3.add_at_final(@et5.suma_kcal)
	@menu3.add_at_final(@et1.suma_kcal)

	expect(@menu3.collect { |x| x.round(2)}).to eq([415.9,683.6,529.6,382.0,622.3])
	expect(@menu3.reduce(:+).round(1)).to eq(2633.4)
	expect(@menu3.reduce(:+).between?((@pac1.gasto_energetico_total*0.90),(@pac1.gasto_energetico_total*1.10))).to eq(true)
	expect(@menu3.reduce(:+).between?((@pac2.gasto_energetico_total*0.90),(@pac2.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu3.reduce(:+).between?((@pac3.gasto_energetico_total*0.90),(@pac3.gasto_energetico_total*1.10))).to eq(true)
	expect(@menu3.reduce(:+).between?((@pac4.gasto_energetico_total*0.90),(@pac4.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu3.reduce(:+).between?((@pac5.gasto_energetico_total*0.90),(@pac5.gasto_energetico_total*1.10))).to eq(false)
	
	
	@menu4.add_at_final(@et2.suma_kcal)
	@menu4.add_at_final(@et5.suma_kcal)
	@menu4.add_at_final(@et7.suma_kcal)
	
	expect(@menu4.collect { |x| x.round(2)}).to eq([683.6,382.0,529.6])
	expect(@menu4.reduce(:+).round(1)).to eq(1595.2)
	expect(@menu4.reduce(:+).between?((@pac1.gasto_energetico_total*0.90),(@pac1.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu4.reduce(:+).between?((@pac2.gasto_energetico_total*0.90),(@pac2.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu4.reduce(:+).between?((@pac3.gasto_energetico_total*0.90),(@pac3.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu4.reduce(:+).between?((@pac4.gasto_energetico_total*0.90),(@pac4.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu4.reduce(:+).between?((@pac5.gasto_energetico_total*0.90),(@pac5.gasto_energetico_total*1.10))).to eq(true)
	
	@menu5.add_at_final(@et4.suma_kcal)
	@menu5.add_at_final(@et7.suma_kcal)
	@menu5.add_at_final(@et1.suma_kcal)
	@menu5.add_at_final(@et2.suma_kcal)

	expect(@menu5.collect { |x| x.round(2)}).to eq([415.9,529.6,622.3,683.6])
	expect(@menu5.reduce(:+).round(1)).to eq(2251.4)
	expect(@menu5.reduce(:+).between?((@pac1.gasto_energetico_total*0.90),(@pac1.gasto_energetico_total*1.10))).to eq(true)
	expect(@menu5.reduce(:+).between?((@pac2.gasto_energetico_total*0.90),(@pac2.gasto_energetico_total*1.10))).to eq(false)
	expect(@menu5.reduce(:+).between?((@pac3.gasto_energetico_total*0.90),(@pac3.gasto_energetico_total*1.10))).to eq(true)
	expect(@menu5.reduce(:+).between?((@pac4.gasto_energetico_total*0.90),(@pac4.gasto_energetico_total*1.10))).to eq(true)
	expect(@menu5.reduce(:+).between?((@pac5.gasto_energetico_total*0.90),(@pac5.gasto_energetico_total*1.10))).to eq(false)
		
	a = @menu1.zip(@menu2,@menu3,@menu4,@menu5)
	puts a[0]
	expect(a[0].collect { |x| x.round(2)}).to eq([622.3,412.3,415.9,683.6,415.9])
	expect(a[0].reduce(:+).round(1)).to eq(2550.0)
	expect(a[0].reduce(:+).between?((@pac1.gasto_energetico_total*0.90),(@pac1.gasto_energetico_total*1.10))).to eq(true)
	expect(a[0].reduce(:+).between?((@pac2.gasto_energetico_total*0.90),(@pac2.gasto_energetico_total*1.10))).to eq(false)
	expect(a[0].reduce(:+).between?((@pac3.gasto_energetico_total*0.90),(@pac3.gasto_energetico_total*1.10))).to eq(true)
	expect(a[0].reduce(:+).between?((@pac4.gasto_energetico_total*0.90),(@pac4.gasto_energetico_total*1.10))).to eq(false)
	expect(a[0].reduce(:+).between?((@pac5.gasto_energetico_total*0.90),(@pac5.gasto_energetico_total*1.10))).to eq(false)

     end
  end

 end	
