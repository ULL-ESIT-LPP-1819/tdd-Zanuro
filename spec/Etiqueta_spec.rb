require 'lib/Etiqueta.rb'

RSpec.describe Etiqueta do
  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  before :each do
    @et1 = Etiqueta.new("Pizza",40.3,21.2,19.9,6.2,3.1,8.1,'F')
  end    
    
  describe "El nombre de la etiqueta es" do
    it "se almacena correctamente el nombre de la etiqueta" do
      @et1.expect(nombre_etiqueta).to_be eq("Pizza") 
    end
    it "se almacenan correctamente las grasas" do
      @et1.expect(grasas).to_be eq(40.3)  
    end
  end
end
