require 'lib/Etiqueta/Lista.rb'
RSpec.describe Lista do
  
  before :each do
     @et1 =  Tag.new("Pizza",40.3,20.2,25.8,2.1,1.2,8.0,"F")
     @et2 =  Tag.new("Noodles",50.2,15.4,15.2,2.4,4.5,12.1,"F")
     @nodo1 = Node.new(@et1.nombre_etiqueta,0,0)
     @nodo2 = Node.new(@et1.grasas,0,0)     
     @lista = ListaDoble.new(0)
     
  end
 	 
  describe "almacenamiento de la etiqueta" do
    it "Se almacena la etiqueta " do
        expect(@et1.nombre_etiqueta).to eq("Pizza")
	expect(@et1.obtener_nombre).to eq("Pizza")
	expect(@et2.nombre_etiqueta).to eq("Hamburguesa")
    end 
  end
end
