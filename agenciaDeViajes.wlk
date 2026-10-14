class Pack {
    method duracion() {}
    method precioBase() {}
    method beneficiosEspeciales() {}
    method coordinadorACargo() {}
    method beneficiosVigentes() {
        self.beneficiosEspeciales().filter(b => b.estaVigente())
    }
    method sumarCostosDeBeneficios(listaDeBeneficio) {
        listaDeBeneficio.sum(b => b.costo)
    }
    method precioFinal() {
        self.precioBase() + self.sumarCostosDeBeneficios(beneficiosVigentes)
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

    override method precioFinal() {
        super() + (super() * 0.2)
    }
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


