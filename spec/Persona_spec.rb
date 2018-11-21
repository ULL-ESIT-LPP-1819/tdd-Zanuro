RSpec.describe Etiqueta do

  before :each do
    @in1 = Individuo.new("Juan")
    @in2 = Individuo.new("Maria")
    @et1 =  Paciente.new("Juan",72.3,182.3,'1',43,84.2,95.5)
    @et2 =  Paciente.new("Maria",62.2,167.2,'0',38,70.2,74)
    @et3 =  Paciente.new("Jose",97.3,178.2,'1',31,88,98.4)
    @et4 =  Paciente.new("Jesus",68.3,172.0,'1',18,75.3,85.3)
    @et5 =  Paciente.new("Daniela",58.4,161.2,'0',36,68,73.2)
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
      expect(@lista.get_tail).equal?(Node)
      expect(@lista.get_tail.value.nombre).to eq("Juan")
      @lista.add_at_final(@et2)
      expect(@lista.get_tail.value.nombre).to eq("Maria")
      @lista.add_at_final(@et3)
      expect(@lista.get_tail.value.nombre).to eq("Jose")
      @lista.add_at_final(@et4)
      expect(@lista.get_tail.value.nombre).to eq("Jesus")
      @lista.add_at_final(@et5)
      expect(@lista.get_tail.value.nombre).to eq("Daniela")
    end
  end

  describe "jerarquia de las clases" do
    it "se comprueba la jerarquia de las clases" do
      expect(@in1).is_a?(Individuo)
      expect(@in1).is_a?(Paciente)
      expect(@in1).is_a?(Object)
      expect(@in1).is_a?(BasicObject)

      expect(@et1).is_a?(Paciente)
      expect(@et1).is_a?(Object)
      expect(@et1).is_a?(BasicObject)

      expect(@lista).is_a?(ListaDoble)
      expect(@lista).is_a?(Object)
      
      expect(@et1).to be_a_kind_of(Paciente)
      expect(@in1).to be_a_kind_of(Individuo)
      expect(@et2).not_to be_a_kind_of(ListaDoble)
    end

    it "otros metodos de comprobacion de la jerarquia" do
	expect(@et1.class).to eq(Paciente)
	expect(@et1.class.superclass).to eq(Individuo)
	expect(@in1.class.superclass).to eq(Object)
	expect(@et1.class.ancestors.include? (Object)).to eq (true)
	expect(@et1.class.ancestors.include? (BasicObject)).to eq(true)
	expect(@in1.class.ancestors.include? (Object)).to eq(true)
	expect(@in1.class.ancestors.include? (BasicObject)).to eq(true)
	puts Individuo.to_s
	puts Paciente.to_s
     end
  end

  describe "pertenencia a una de las clases" do
    it "se comprueba la pertenencia a una clase en concreto" do
      expect(@in1).instance_of?(Individuo)
      expect(@in1.instance_of?Individuo).to eq(true)
      expect(@in1).instance_of?Object
      expect(@in1).instance_of?BasicObject
      expect(@et1).instance_of?(Individuo)
      expect(@et1).instance_of?(Paciente)
      expect(@in1).instance_of?Object
      expect(@in1).instance_of?BasicObject
      expect(@lista).instance_of?(ListaDoble)
      expect(@lista).instance_of?(BasicObject)
      #@in1.respond_to(:to_s)
    end
  end
	


  describe "comprobamos las funciones" do
 	it "comprobacion del tipo de funciones de las clases" do
	expect(Individuo.private_method_defined? (:initialize)).to eq(true)
	expect(Paciente.private_method_defined? (:initialize)).to eq(true)
        expect(Paciente.method_defined? (:get_data)).to eq(true)
	expect(Paciente.respond_to?('otra_funcion')).to eq(false)
	expect(Individuo.respond_to?('to_s')).to eq(true)
	end
   end

  describe "Comprobacion de la clasificacion del imc" do
    it "comprobamos los valores de imc que coge cada persona" do
      expect(@lista.add_at_final(@et1)).equal?(Node)
      puts @lista.get_tail.value.nombre,@lista.get_tail.value.data.imc      
      expect(@lista.add_at_final(@et2)).equal?(Node)
      puts @lista.get_tail.value.nombre,@lista.get_tail.value.data.imc      
      expect(@lista.add_at_final(@et3)).equal?(Node)
      puts @lista.get_tail.value.nombre,@lista.get_tail.value.data.imc      
      expect(@lista.add_at_final(@et4)).equal?(Node)
      puts @lista.get_tail.value.nombre,@lista.get_tail.value.data.imc      
      expect(@lista.add_at_final(@et5)).equal?(Node)
      puts @lista.get_tail.value.nombre,@lista.get_tail.value.data.imc      
      @lista.clasf_imc
      

    end
  end
end

