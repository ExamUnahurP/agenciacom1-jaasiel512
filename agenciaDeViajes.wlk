class Pack {
    method duracion() {}
    method precioBase() {}
    method beneficiosEspeciales() {}
    method coordinadorACargo() {}
    method precioFinal() {
        self.precioBase() + self.beneficiosEspeciales()
    }
}

class PackNacional inherits Pack {
    const property provinciaDestino
    const property actividadesIncluidas = []
}

class PackInternacional inherits Pack {
    const property paisDestino
    const property escalas
    const property esDeInteres
}

class Coordinador {
    var viajesRealizados = 0
    var estaMotivado
    var aniosExperiencia = 0
    var rol

    method rolQueCumple() = rol
    method cambiarRol(nuevoRol) {
        rol = nuevoRol
    }
}

class BeneficioEspecial {
    const property tipo
    const property costo
    const property estaVigente
}


