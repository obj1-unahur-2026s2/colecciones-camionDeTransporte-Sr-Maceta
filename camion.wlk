import cosas.*

object camion {
    const carga = []
    method bultos() = carga.sum({c => c.bultos()})
    method peso() = 1000 + (carga.sum({c => c.peso()}))
    method cargar(nuevaCarga) {
        nuevaCarga.sufrirCambios()
        carga.add(nuevaCarga)
    }
    method descargar(cargaAQuitar) {
        carga.remove(cargaAQuitar)
    }
    method pesoCargasEsPar() = 
        carga.all({c => c.peso().even()})
    method hayCargaConPeso(peso) =
        carga.any({c => c.peso() == peso})
    method cargaConPeligro(nPeligro) = 
        carga.find({c => c.peligro() == nPeligro})
    method cargasConPeligroMayorA(nPeligro) = 
        carga.filter({c => c.peligro() > nPeligro})
    method cargasConPeligroMayorANivelDePeligroDe(unaCosa) = 
        carga.filter({c => c.peligro() > unaCosa.peligro()})
    method estaExcedidoDePeso() = 
        self.peso() > 2500
    method puedeCircularEnRuta(nPeligro) = 
        !self.estaExcedidoDePeso() && !self.cargaSupera(nPeligro)
    method cargaSupera(nPeligro) =
        carga.any({c => c.peligro() > nPeligro})
    method hayCargaEntre(valor1, valor2) = 
        carga.any({c => c.peso().between(valor1, valor2)})
    method cargaMasPesada() = 
        carga.max({c => c.peso()})
}