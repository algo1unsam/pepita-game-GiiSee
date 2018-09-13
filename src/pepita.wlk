import ciudades.*

object pepita {

	var property energia = 100
	var property ciudad = buenosAires
	var property posicion = game.at(3, 3)

	// TODO esto no va gi, se ejecuta directamente el método
	// var property imagen
	// TODO ojo por que esto es un getter, y vos lo habías programado como un setter
	// y el problema venia por este lado
	method image() {
		if (self.energia() < 10) {
			return "pepita.png"
		} else if (self.energia() > 100) {
			return "pepona.png"
		} else {
			return "pepita.png"
		}
	}

	method come(comida) {
		energia = energia + comida.energia()
	}

	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			// acá harcodeaste 200, lo que tenes que pasarle es la posición a la cual tiene que ir
			// o la discancia como hiciste vos pero entonces tenes que hacer la cuenta de la distancia
			// desde una posición a la otra
			// recorda que las posiciones entienden el método distance
			if (self.energia() >= self.energiaParaVolar(200)) {
				self.move(unaCiudad.posicion())
				ciudad = unaCiudad
			} else {
				game.say(self, "Dame primero de comer")
			}
		} else {
			game.say(self, "Estoy en BuenosAires")
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}

}

