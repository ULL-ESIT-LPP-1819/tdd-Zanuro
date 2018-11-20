require './lista.rb'
RSpec.describe Etiqueta do

  before :each do
    @in1 = Individuo.new("Juan")
    @in2 = Individuo.new("Maria")
    @et1 =  Paciente.new("Juan",72.3,182.3,'1',43,84.2,95.5)
    @et2 =  Paciente.new("Maria",62.2,167.2,'0',38,70.2,74)
    @et3 =  Paciente.new("Jose",84.6,184.2,'1',27,78.2,84.8)
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
      expect(@in1.is_a?Paciente).to eq(true)
      expect(@in1).is_a?Object
      expect(@in1).is_a?BasicObject
      expect(@et1).is_a?(Individuo)
      expect(@et1).is_a?(Paciente)
      expect(@et1).is_a?Object
      expect(@et1).is_a?BasicObject
      expect(@lista).is_a?(ListaDoble)
      expect(@lista).is_a?Object
      expect(@lista).is_a?Paciente
      #@in1.respond_to(:to_s)
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


  describe "comprobamos las"

  describe "Comprobacion de la clasificacion de la sal" do
    it "comprobamos los valores que coge la sal segun el IR" do
      @lista.add_at_final(@et1)
      @lista.add_at_final(@et2)
      @lista.add_at_final(@et3)
      @lista.add_at_final(@et4)
      @lista.add_at_final(@et5)


    end
  end
end

