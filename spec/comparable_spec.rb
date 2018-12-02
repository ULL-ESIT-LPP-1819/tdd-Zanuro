RSpec.describe Etiqueta do
  
  before :each do
     @et1 = Tag.new("Pizza",40.3,20.2,25.8,5.1,3.2,8.0,"F")
     @et2 = Tag.new("Hamburguesa",57.2,33.1,18.9,6.8,5.5,10.1,"T")
     @et3 = Tag.new("Platano",27.2,16.1,20.8,12.1,10.1,2.5,"F")
     @et4 = Tag.new("Pan",8.5,4.9,52.1,8.1,7.5,5.8,"F")
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

  describe "Comparando los valores de las etiquetas" do
	it "Etiqueta menor que otra" do

	expect(@et1 < @et2).to eq(true)
	expect(@et3 < @et4).to eq(true)
	end
	it "Etiqueta mayor que otra" do
	expect(@et1 > @et2).to eq(false)
	expect(@et3 > @et4).to eq(false)
	end
	it "Etiqueta menor o igual que otra" do
	expect(@et1 <= @et2).to eq(true)
	expect(@et3 <= @et4).to eq(true)
	end
	it "Etiqueta mayor o igual que otra" do
	expect(@et1 >= @et2).to eq(false)
	expect(@et3 >= @et4).to eq(false)
	end   
	it "Etiqueta menor que otra" do
	expect(@et1 < @et2).to eq(true)
	expect(@et3 < @et4).to eq(true)
	end
	it "Etiqueta igual que otra" do
	expect(@et1 == @et2).to eq(false)
	expect(@et3 == @et4).to eq(false)
	end
	it "Etiqueta entre otras etiquetas" do
	expect(@et1.between?(@et2,@et3)).to eq(false)
	expect(@et2.between?(@et3,@et4)).to eq(false)
	end    
     end
 end	

