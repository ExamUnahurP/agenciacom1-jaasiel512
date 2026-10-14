class Pack {
    method duracion() {}
    method precioBase() {}
    method beneficiosEspeciales() {}
    method coordinadorACargo() {}
}

class PackNacional inherits Pack {
    const provinciaDestino
    const actividadesIncluidas = []
}

class PackInternacional inherits Pack {
    const paisDestino
    
}

