class Pack {
    method duracionDeVuelo() {}
    method precioBaseDeVuelo() {}
    method beneficiosEspecialesDeViaje() {}
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
    const duracion
    const precioBase
    const beneficiosEspeciales = []
    const coordinador
    
    override method duracionDeVuelo() = duracion
    override method precioBaseDeVuelo() = precioBase
    override method beneficiosEspecialesDeViaje() = beneficiosEspeciales
    override method coordinadorACargo() = coordinador
}

class PackInternacional inherits Pack {
    const property paisDestino
    const property escalas
    const property esDeInteres
    const duracion
    const precioBase
    const beneficiosEspeciales
    const coordinador

    override method duracionDeVuelo() = duracion
    override method precioBaseDeVuelo() = precioBase
    override method beneficiosEspecialesDeViaje() = beneficiosEspeciales
    override method coordinadorACargo() = coordinador

    override method precioFinal() {
        super() + (self.precioBase() + self.sumarCostosDeBeneficios(beneficiosVigentes) * 0.2)
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