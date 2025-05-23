import rodados.*

class Dependencia {
    const property flota = []
    var property empleados

    method agregarFlota(unRodado) {
      flota.add(unRodado)
    }

    method quitarDeFlota(unRodado) {
      flota.remove(unRodado)
    }

    method pesoTotalFlota() = flota.sum({r => r.peso()})

    method estaBienEquipada() = 
        self.tieneAlMenosRodados(3) and 
        self.todosVanAlmenosAKm(100)

    method tieneAlMenosRodados(cantidad) = flota.size() >= cantidad
    method todosVanAlmenosAKm(vel) = flota.all({r => r.velMax()>= vel})

    method capacidadTotalEnColor(color) = self.rodadosDelColor(color).sum({r => r.capacidad()})

    method rodadosDelColor(color) = flota.filter({r => r.color() == color})

    method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()

    method rodadoMasRapido() = flota.max({r => r.velMax()})

    method capacidadFaltante() = 0.max(empleados - self.capacidadFlota())

    method capacidadFlota() = flota.sum({r => r.capacidad()})

    method esGrande() = empleados >= 40 and self.tieneAlMenosRodados(5)
}

