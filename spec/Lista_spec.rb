require 'lib/Etiqueta/Lista.rb'
RSpec.describe Etiqueta do
  
  before :each do
     @et1 =  Tag.new("Pizza",40.3,20.2,25.8,2.1,1.2,8.0,"F")
     @et2 =  Tag.new("Noodles",30.2,15.4,15.2,2.4,4.5,12.1,"F")
     @et3 =  Tag.new("Manzana",15.2,8.4,9.4,1.5,7,0.8,"F")
     @et4 =  Tag.new("Hamburguesa",50.8,20.5,10.1,3.0,6,10.0,"F")
     @et5 =  Tag.new("Coca-cola",30.4,17.2,8.4,18.4,2.1,1.2,"F")
     @nodo1 = Node.new(@et1,0,0)
     @nodo2 = Node.new(@et2,0,0)
     @nodo3 = Node.new(@et3,0,0)
     @nodo4 = Node.new(@et4,0,0)
     @nodo5 = Node.new(@et5,0,0)     
     @lista = ListaDoble.new(0)
     
  end
 	 
  describe "insercion" do
    it "Se comprueba la insercion de los elementos" do
        @lista.add_at_final(@nodo1)
	puts @lista.get_head
	@lista.add_at_final(@nodo2)
	puts @lista.get_head
	@lista.add_at_final(@nodo3)
	puts @lista.get_head
	@lista.add_at_final(@nodo4)
	puts @lista.get_head
	@lista.add_at_final(@nodo5)
	puts @lista.get_head
    end 
  end

  describe "empty" do
     it "comprobacion de si la lista esta vacia o no" do
	expect(@lista.empty).to eq(true)

     end
  end
 
  describe "mostrar el head y el tail" do
     it "comprobacion del head y el tail" do
	puts @lista.get_head
	puts @lista.get_tail
     end
  end

  describe "extraccion de los elementos" do
    it "comprueba la extraccion de los elementos de la lista" do
	@lista.extraer_begin
	@lista.extraer_begin
	@lista.extraer_begin
	@lista.extraer_begin
	@lista.extraer_begin
    end  
  end

end
   
