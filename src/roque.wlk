import ciudades.*

// TODO arreglar todo roque
object roque{
	 
	 var property posicion = game.at(4,8)
	 var comidaActual = null
	 var property energia = 100
	 var property ciudad = villaGesell
	
	 method imagen() = "jugador.png"
	 
	 method come(comida) {
		energia = energia + comida.energia()
	}
	
	 method levantar(comida){
		if(comidaActual != null){
			game.addVisualIn(comidaActual,posicion.up(1))
		}
	 	comidaActual = comida
	 	game.removeVisual(comida)
	 }
	
	  method volaHacia(unaCiudad){
	 	if(ciudad != unaCiudad){
	 		self.move(unaCiudad.posicion())
	 		ciudad = unaCiudad
	 	} 
	 }
	 
	 method energiaParaVolar(distancia) = 15 + 5 * distancia
	 
	 method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}	
	
	
}
