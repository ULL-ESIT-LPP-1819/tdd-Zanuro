RSpec.describe Etiqueta do
  
  before :each do
     @et1 =  Tag.new("Pizza",40.3,20.2,25.8,2.1,1.2,8.0,"F")
     @et2 =  Tag.new("Noodles",30.2,15.4,15.2,2.4,4.5,12.1,"F")
     @et3 =  Tag.new("Manzana",15.2,8.4,9.4,1.5,7,0.8,"F")
     @et4 =  Tag.new("Hamburguesa",50.8,20.5,10.1,3.0,6,10.0,"F")
     @et5 =  Tag.new("Coca-cola",30.4,17.2,8.4,18.4,2.1,1.2,"F")
     #@nodo1 = Node.new(@et1,@nodo2,nil)
     #@nodo2 = Node.new(@et2,@nodo3,@nodo1)
     #@nodo3 = Node.new(@et3,@nodo4,@nodo2)
     #@nodo4 = Node.new(@et4,@nodo5,@nodo3)
     #@nodo5 = Node.new(@et5,nil,@nodo4)     
    @lista = ListaDoble.new(0)
     
  end
 	 
  describe "insercion" do
    it "Se comprueba la insercion de los elementos" do
	@lista.add_at_final(@et1)
	#puts "#{@lista.get_tail} \n"
	expect(@lista.get_tail).equal?(Node)
	@lista.add_at_final(@et2)
	expect(@lista.get_tail.value.nombre_etiqueta).to eq("Noodles")
	#puts "#{@lista.get_tail} \n"	
        @lista.add_at_final(@et3)
	expect(@lista.get_tail.value.nombre_etiqueta).to eq("Manzana")
	#puts "#{@lista.get_tail} \n"
	@lista.add_at_final(@et4)
	expect(@lista.get_tail.value.nombre_etiqueta).to eq("Hamburguesa")
	#puts "#{@lista.get_tail} \n"
	@lista.add_at_final(@et5)
	expect(@lista.get_tail.value.nombre_etiqueta).to eq("Coca-cola")
	#puts "#{@lista.get_tail} \n"
    end 
  end

  describe "size" do
     it "comprobacion del tamano de la lista" do
	expect(@lista.length).to eq(0)
	@lista.add_at_final(@et1)
	expect(@lista.length).to eq(1)
	@lista.add_at_final(@et2)
	expect(@lista.length).to eq(2)
	@lista.add_at_final(@et3)
	expect(@lista.length).to eq(3)
	@lista.add_at_final(@et4)
	expect(@lista.length).to eq(4)
	@lista.add_at_final(@et5)
	expect(@lista.length).to eq(5)
	
     end
  end

  describe "empty" do
     it "comprobacion de si la lista esta vacia o no" do
	expect(@lista.empty).to eq(true)
	@lista.add_at_final(@et1)
	expect(@lista.empty).to eq(false)
	@lista.extraer_begin
	expect(@lista.empty).to eq(true)
     end
  end
 
  describe "mostrar el head y el tail" do
     it "comprobacion del head y el tail" do
	@lista.add_at_final(@et1)
	@lista.add_at_final(@et2)
	@lista.add_at_final(@et3)
	@lista.add_at_final(@et4)
	@lista.add_at_final(@et5)
	expect(@lista.get_head).equal?(Node)
	expect(@lista.get_tail).equal?(Node)
	expect(@lista.get_head.value).equal?(Tag)
	expect(@lista.get_tail.value).equal?(Tag)
     end
  end
	
  describe "mostrar los elemenots de la lista" do
     it "comprobar los valores de la lista" do
	@lista.add_at_final(@et1)
	@lista.add_at_final(@et2)
	@lista.add_at_final(@et3)
	@lista.add_at_final(@et4)
	@lista.add_at_final(@et5)	
  	@lista.print
	
	 end
  end
  describe "extraccion de los elementos" do
    it "comprueba la extraccion de los elementos de la lista" do
	expect(@lista.length).to eq(0)
	expect(@lista.empty).to eq(true)
	@lista.add_at_final(@et1)
	@lista.add_at_final(@et2)
	@lista.add_at_final(@et3)
	@lista.add_at_final(@et4)
	@lista.add_at_final(@et5)
	expect(@lista.length).to eq(5)
	expect(@lista.extraer_begin).equal?(Node)
	expect(@lista.length).to eq(4)
	expect(@lista.extraer_begin).equal?(Node)
	expect(@lista.length).to eq(3)
	expect(@lista.extraer_begin).equal?(Node)	
	expect(@lista.length).to eq(2)
	expect(@lista.extraer_begin).equal?(Node)
	expect(@lista.length).to eq(1)
	expect(@lista.extraer_begin).equal?(Node)
	expect(@lista.empty).to eq(true)
		
       end  
  end

   describe "Comprobacion de la clasificacion de la sal" do
	it "comprobamos los valores que coge la sal segun el IR" do
	@lista.add_at_final(@et1)
	@lista.add_at_final(@et2)
	@lista.add_at_final(@et3)
	@lista.add_at_final(@et4)
	@lista.add_at_final(@et5)
	@lista.clasificacion
	
	end
   end
end
   
