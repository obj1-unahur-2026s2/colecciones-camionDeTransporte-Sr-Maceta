object knightRider {
    method peso() = 500
    method peligro() = 10
    method bultos() = 1
    method sufrirCambios() {}
}

object bumblebee {
    var estado = auto
    method peso() = 800
    method peligro() = estado.peligro()
    method bultos() = 2
    method sufrirCambios() {
        self.transformarA(robot)
    }  
    method transformarA(nuevoEstado) {
        estado = nuevoEstado
    }
}

object auto {
    method peligro() = 15
}

object robot {
    method peligro() = 30
}

object paqueteDeLadrillos {
    var ladrillos = 1
    method peso() = ladrillos*2
    method peligro() = 2
    method bultos() =
        if(ladrillos <= 100) 1
        else if(ladrillos <= 300) 2
        else 3
    method sufrirCambios() {
        self.agregarLadrillos(12)
    }
    method agregarLadrillos(cantidad) {
        ladrillos += cantidad
    }
    method quitarLadrillos(cantidad) {
        ladrillos -= cantidad
    }
}

object arenaAGranel {
    var peso = 10
    method peso() = peso
    method peligro() = 1
    method bultos() = 1
    method sufrirCambios() {
        self.quitarPeso(10)
    }
    method agregarPeso(pesoAgregado) {
        peso += pesoAgregado
    }
    method quitarPeso(pesoQuitado) {
        peso -= pesoQuitado
    }
}

object bateriaAntiaerea {
    var tieneMisiles = true
    method peso() = if(tieneMisiles) 300 else 200
    method peligro() = if(tieneMisiles) 100 else 0
    method bultos() = if(tieneMisiles) 2 else 1
    method sufrirCambios() {
        tieneMisiles = true
    }
    method alternarMisiles(){
        tieneMisiles = !tieneMisiles
    }
}

object contenedorPortuario {
    const contenedor = []
    method peso() = 100 + (contenedor.sum({c => c.peso()}))
    method peligro() = 
        if(contenedor.isEmpty()) 0
        else contenedor.max({c => c.peligro()}).peligro()
    method bultos() = 1 + contenedor.sum({c => c.bultos()})
    method sufrirCambios() {
        contenedor.forEach({c => c.sufrirCambios()})
    }
    method agregar(objeto) {
        contenedor.add(objeto)
    }
}

object residuosRadioactivos {
    var peso = 5
    method peso() = peso
    method peligro() = 200
    method bultos() = 1
    method sufrirCambios() {
        self.agregarPeso(15)
    }
    method agregarPeso(pesoAgregado) {
        peso += pesoAgregado
    }
    method quitarPeso(pesoQuitado) {
        peso -= pesoQuitado
    }
}

object embalajeDeSeguridad {
    var objetoEnvuelto = null
    method peso() = objetoEnvuelto.peso()
    method peligro() = objetoEnvuelto.peligro()/2
    method bultos() = 2
    method sufrirCambios() {}
    method envolver(objeto) {
        objetoEnvuelto = objeto
    }
}