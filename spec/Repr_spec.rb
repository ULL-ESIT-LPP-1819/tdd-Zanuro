require 'benchmark'

RSpec.describe Etiqueta do
  
  before :all do
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
     
     @m0 = [@et3,@et5,@et7]
     @m1 = [@et2,@et6,@et4]
     @m2 = [@et1,@et3,@et5]
     @m3 = [@et4,@et1,@et3]
     @m4 = [@et5,@et6,@et7]
     @m5 = [@et2,@et3,@et1]
     @m6 = [@et4,@et5,@et6]
     @m7 = [@et7,@et2,@et1]
     @m8 = [@et5,@et3,@et4]
     @m9 = [@et2,@et7,@et4]
     @array_menus=[@m0,@m1,@m2,@m3,@m4,@m5,@m6,@m7,@m8,@m9]
     
     @lista.add_at_final(@pac1)
     @lista.add_at_final(@pac2)
     @lista.add_at_final(@pac3)
     @lista.add_at_final(@pac4)
     @lista.add_at_final(@pac5)
     @lista.add_at_final(@pac6)
     @lista.add_at_final(@pac7)
     @lista.add_at_final(@pac8)
     @lista.add_at_final(@pac9)
     @lista.add_at_final(@pac0)

  end
 	 
  describe "ordenacion del array de menus" do
  	it "ordenacion mediante el for" do
	expect(@array_menus.ordenar_con_for).to eq([])
	end
	it "ordenacion mediante el each" do
	expect(@array_menus.ordenar_con_each).to eq([])
	end
	it "ordenacion mediante el sort" do
	expect(@array_menus.sort).to eq([])
	end
	it "benchmark para el array" do
	
	n=10000
	Benchmark.bm do |x|
	x.report("for:") { n.times do @array_menus.ordenar_con_for }	
	x.report("each:"){ n.times do @array_menus.ordenar_con_each }
	x.report("sort:"){ n.times do @array_menus.sort }
	end
	end
  end
   describe "ordenacion de la lista de las valoraciones nutricionales de individuos" do
  	it "ordenacion mediante el for" do
	expect(@lista.ordenar_con_for).to eq([])
	end
	it "ordenacion mediante el each" do
	expect(@lista.ordenar_con_each).to eq([])
	end
	it "ordenacion mediante el sort" do
	expect(@lista.sort).to eq([])
	end
	it "benchmark para el array" do
	
	n=10000
	Benchmark.bm do |x|
	x.report("for:") { n.times do @lista.ordenar_con_for }	
	x.report("each:"){ n.times do @lista.ordenar_con_each }
	x.report("sort:"){ n.times do @lista.sort }
	end
	end
  end
	
  	  
 end

