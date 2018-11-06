require "Etiqueta/version"

class Tag

def initialize(nombre_etiqueta,grasas,grasas_saturadas,hidratos,azucares,proteinas,sal,dividido)
    @nombre_etiqueta = String(nombre_etiqueta)
    @grasas = Float(grasas)
    @grasas_saturadas = Float(grasas_saturadas)
    @hidratos = Float(hidratos)
    @azucares = Float(azucares)
    @proteinas = Float(proteinas)
    @sal = Float(sal)
    @dividido = Char(dividido)
end

end
