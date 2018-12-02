RSpec.describe Etiqueta do
  
  before :each do
     @et1 = Tag.new("Pizza",40.3,20.2,25.8,5.1,3.2,8.0,"F")
     @et2 = Tag.new("Hamburguesa",57.2,33.1,18.9,6.8,5.5,10.1,"T")
     @et3 = Tag.new("Platano",27.2,16.1,20.8,12.1,10.1,2.5,"F")
     @et4 = Tag.new("Pan",8.5,4.9,52.1,8.1,7.5,5.8,"F")
     @in1 = Datos.new(85.5,184.2,'1',43,85.2,102.4)
     @in2 = Datos.new(65.2,172.3,'0',37,70.2,84.7)
     @in3 = Datos.new(90.4,188.2,'1',44,97.2,104.3)
     @in4 = Datos.new(75.4,182,'0',51,72.4,85.3) 
     @pers1 = Individuo.new("Juan")
     @pers2 = Individuo.new("Maria")
     @pac1 =  Paciente.new("Juan",72.3,182.3,'1',43,84.2,95.5)
     @pac2 =  Paciente.new("Maria",62.2,167.2,'0',38,70.2,74)
     @pac3 =  Paciente.new("Jose",97.3,178.2,'1',31,88,98.4)
     @pac4 =  Paciente.new("Jesus",68.3,172.0,'1',18,75.3,85.3)
  end
 	 
  describe "almacenamiento de la etiqueta" do
    it "Se almacena la etiqueta " do
        expect(@et1.nombre_etiqueta).to eq("Pizza")
	expect(@et1.obtener_nombre).to eq("Pizza")
	expect(@et2.nombre_etiqueta).to eq("Hamburguesa")
	expect(@et3.nombre_etiqueta).to eq("Platano")
	expect(@et4.nombre_etiqueta).to eq("Pan")
    end 
  end
  describe "almacenamiento de los pacientes" do
    it "se almacenan los pacientes" do
        expect(@pac1.nombre).to eq("Juan")
	expect(@pac2.nombre).to eq("Maria")
	expect(@pac3.nombre).to eq("Jose")
    end
  end
  describe "Almacenamiento de los datos" do
     it "Se almacenan los datos" do
         expect(@et1.grasas).to eq(40.3)
	 expect(@et2.grasas).to eq(57.2)
	 expect(@et1.grasas_saturadas).to eq(20.2)
	 expect(@et2.grasas_saturadas).to eq(33.1)
         expect(@et1.hidratos).to eq(25.8)
	 expect(@et2.hidratos).to eq(18.9)
         expect(@et1.azucares).to eq(5.1)
         expect(@et1.proteinas).to eq(3.2)
         expect(@et1.sal).to eq(8.0)
      end
   end

  describe "almacenar los datos" do
     it "se almacenan los datos" do
	expect(@pac1.data.peso).to eq(72.3)
	expect(@pac1.data.cadera).to eq(95.5)
	expect(@pac2.data.edad).to eq(38)
	expect(@pac2.data.cintura).to eq(70.2)
	expect(@pac3.data.altura).to eq(178.2)
	expect(@pac3.data.sexo).to eq('1')
	expect(@pac4.data.cintura).to eq(75.3)
	expect(@pac4.data.edad).to eq(18)
      end
  end

  describe "Comparando los valores de las etiquetas en funcion del nombre de la etiqueta" do
	it "Etiqueta menor que otra" do

	expect(@et1 < @et2).to eq(false)
	expect(@et3 < @et4).to eq(false)
	end
	it "Etiqueta mayor que otra" do
	expect(@et1 > @et2).to eq(true)
	expect(@et3 > @et4).to eq(true)
	end
	it "Etiqueta menor o igual que otra" do
	expect(@et1 <= @et2).to eq(false)
	expect(@et3 <= @et4).to eq(false)
	end
	it "Etiqueta mayor o igual que otra" do
	expect(@et1 >= @et2).to eq(true)
	expect(@et3 >= @et4).to eq(true)
	end   
	it "Etiqueta igual que otra" do
	expect(@et1 == @et2).to eq(false)
	expect(@et3 == @et4).to eq(false)
	end
	it "Etiqueta entre otras etiquetas" do
	expect(@et1.between?(@et2,@et3)).to eq(true)
	expect(@et2.between?(@et3,@et4)).to eq(false)
	end    
     end
     describe "Comparando los valores de los pacientes en funcion del peso del paciente" do
	it "Etiqueta menor que otra" do

	expect(@pac1 < @pac2).to eq(false)
	expect(@pac3 < @pac4).to eq(false)
	end
	it "Etiqueta mayor que otra" do
	expect(@pac1 > @pac2).to eq(true)
	expect(@pac3 > @pac4).to eq(true)
	end
	it "Etiqueta menor o igual que otra" do
	expect(@pac1 <= @pac2).to eq(false)
	expect(@pac3 <= @pac4).to eq(false)
	end
	it "Etiqueta mayor o igual que otra" do
	expect(@pac1 >= @pac2).to eq(true)
	expect(@pac3 >= @pac4).to eq(true)
	end
	it "Etiqueta igual que otra" do
	expect(@pac1 == @pac2).to eq(false)
	expect(@pac3 == @pac4).to eq(false)
	end
	it "Etiqueta entre otras etiquetas" do
	expect(@pac1.between?(@pac2,@pac3)).to eq(true)
	expect(@pac2.between?(@pac3,@pac4)).to eq(false)
	end    
     end
 end	
