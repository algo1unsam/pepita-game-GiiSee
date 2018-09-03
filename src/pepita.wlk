import ciudades.*

object pepita {
	
	var property energia = 100
	var property ciudad = buenosAires 
    var property posicion = game.at(3,3)
	var property imagen  
		
	method imagen(unaImagen){
		
		if(self.energia() < 10){
			imagen = "pepita.png"
		}
		if(self.energia() > 100){
			imagen = "pepona.png"
		}
		    imagen = "pepita.png"
	}  

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
		if(self.energia() >= self.energiaParaVolar(200)){
			self.move(unaCiudad.posicion())
			ciudad = unaCiudad
		}	
		 else{
		 	game.say(self,"Dame primero de comer")
		 }	
			}
		else	{
			game.say(self,"Estoy en BuenosAires")
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
}
