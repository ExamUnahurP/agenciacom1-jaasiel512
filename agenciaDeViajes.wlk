class Pack {
    method duracionDeVuelo() {}
    method precioBaseDeViaje() {}
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
    method esPremium() {}
}

class PackNacional inherits Pack {
    const property provinciaDestino
    const property actividadesIncluidas = []
    const duracion
    const precioBase
    const beneficiosEspeciales = []
    const coordinador
    
    override method duracionDeViaje() = duracion
    override method precioBaseDeVuelo() = precioBase
    override method beneficiosEspecialesDeViaje() = beneficiosEspeciales
    override method coordinadorACargo() = coordinador
    override method esPremium() {
        duracion > 10 and coordinador.esCalificado()
    }
}

class PackInternacional inherits Pack {
    const property paisDestino
    const property escalas
    const property esDeInteres
    const duracion
    const precioBase
    const beneficiosEspeciales
    const coordinador

    override method duracionDeViaje() = duracion
    override method precioBaseDeVuelo() = precioBase
    override method beneficiosEspecialesDeViaje() = beneficiosEspeciales
    override method coordinadorACargo() = coordinador

    override method precioFinal() {
        super() + ((self.precioBase() + self.sumarCostosDeBeneficios(beneficiosVigentes)) * 0.20)
    }
    override method esPremium() {
        esDeInteres() and duracion > 20 
    }
}

class Coordinador {
    var viajesRealizados = 0
    var motivado
    var aniosExperiencia = 0
    var rol

    method rolQueCumple() = rol
    method cambiarRol(nuevoRol) {
        if(nuevoRol == "Guia" or nuevoRol == "Acompaniante" or nuevoRol == "Asistente logístico"){
            rol = nuevoRol
        } else {
            self.error("Rol no conocido")
        }
    }
    method esCalificado() {
        viajesRealizados > 20 and ((rol == "Guia" and motivado) or (rol == "Asistente logístico" and aniosExperiencia == 3) or (rol == "Acompaniante"))
    }
    method estaMotivado() = motivado
    method viajes() = viajesRealizados
    method experiencia() = aniosExperiencia
}

class BeneficioEspecial {
    const property tipo
    const property costo
    const property estaVigente
}