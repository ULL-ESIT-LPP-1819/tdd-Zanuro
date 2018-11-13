require 'lib/Etiqueta/Etiqueta.rb'
RSpec.describe Etiqueta do
  
  before :each do
     @et1 = Tag.new("Pizza",40.3,20.2,25.8,5.1,3.2,8.0,"F")
     @et2 = Tag.new("Hamburguesa",57.2,33.1,18.9,6.8,5.5,10.1,"T")
  end
 	 
  describe "almacenamiento de la etiqueta" do
    it "Se almacena la etiqueta " do
        expect(@et1.nombre_etiqueta).to eq("Pizza")
	expect(@et1.obtener_nombre).to eq("Pizza")
	expect(@et2.nombre_etiqueta).to eq("Hamburguesa")
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
         expect(@et1.dividido).to eq("F")
	 expect(@et2.dividido).to eq("T")
      end
   end
  
   describe "Comprobacion de si el paquete es unico" do
      it "Comprobamos si el paquete es dividido" do
	 expect(@et1.porciones).to eq(1)
 	 expect(@et2.porciones).to eq(6)
      end
   end
   
   describe "La suma de todos los valores " do
	it "comprobamos la suma de todos los valores" do
           expect(@et1.suma_valores).to eq(102.6)
	end
   end

   describe "Los kJ totales del producto" do
	it "comprobamos la suma de todos los kJ del prod" do
	    expect(@et1.suma_kj).to eq(2184.1)

	end
   end
      
   describe "Los kcal totales del producto" do
       it "comprobamos la suma de todos las kcal del prod" do
            expect(@et1.suma_kcal).to eq(526.7)

        end
   end

   describe "Ingesta referencial de algunos nutrientes" do
	it "comprobamos el IR de algunos nutrientes" do
	    expect(@et1.ingesta_referencia(@et1.grasas)).to eq(39.28)
	    expect(@et1.ingesta_referencia(@et1.grasas_saturadas)).to eq(19.69)
	    expect(@et1.ingesta_referencia(@et1.hidratos)).to eq(25.15)
	    expect(@et1.ingesta_referencia(@et1.azucares)).to eq(4.97)
            expect(@et1.ingesta_referencia(@et1.proteinas)).to eq(3.12)
	    expect(@et1.ingesta_referencia(@et1.sal)).to eq(7.8)
	end
    end

   describe "valores en KJ/g de los nutrientes" do
	it "comprobamos los kJ/g de algunos nutrientes" do
	    expect(@et1.grasa_kj_g).to eq(1491.1)
	    expect(@et1.monoins_kj_g).to eq(0)
	    expect(@et1.poli_kj_g).to eq(0)
            expect(@et1.hidratos_kj_g).to eq(438.6)
            expect(@et1.fibra_kj_g).to eq(0)
	    expect(@et1.proteinas_kj_g).to eq(54.4)
            expect(@et1.sal_kj_g).to eq(200.0)
	end
   end

   describe "valores en kcal/g de los nutrientes" do
        it "comprobamos los kcal/g de algunos nutrientes" do
            expect(@et1.grasa_kcal_g).to eq(362.7)
            expect(@et1.monoins_kcal_g).to eq(0)
            expect(@et1.poli_kcal_g).to eq(0)
            expect(@et1.hidratos_kcal_g).to eq(103.2)
            expect(@et1.fibra_kcal_g).to eq(0)
            expect(@et1.proteinas_kcal_g).to eq(12.8)
            expect(@et1.sal_kcal_g).to eq(48.0)
        end
   end

   describe "Imprimir etiqueta valor nutricional" do
       it "comprobamos el imprimir de la etiqueta" do
	    expect(@et1.imprimir_etiqueta).to eq(nil)
	    expect(@et2.imprimir_etiqueta).to eq(nil)
	end
   end

   describe "Imprimimos los valores optimos recomendados" do
	it "comprobamos nuestros valores nutricionales frente a los recomendados" do
   	     expect(@et1.valores_opt).to eq(nil)
	     expect(@et2.valores_opt).to eq(nil)
        end
   end	
end

