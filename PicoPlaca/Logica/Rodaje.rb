require './Constantes/Constantes.rb'
require 'time'
class Rodaje

	attr_accessor :matricula, :fecha, :hora
	
	def validaRodaje(_rodaje)
		dia= Time.strptime(_rodaje.fecha, '%d/%m/%Y')  
		_rodaje.fecha = dia.strftime("%A")
		ultimoDigito=_rodaje.matricula.reverse[0,1].to_i		
		Constantes::DIAS.each {|dia|			
			if _rodaje.fecha.upcase == dia[0]
				#puts "fecha igual"
				if (ultimoDigito==dia[1] || ultimoDigito==dia[2])
					#puts "placa termina con codigo"					
					if ((Time.parse(_rodaje.hora)) >= (Time.parse(Constantes::HORAINICIODIA)) && (Time.parse(_rodaje.hora)) <= (Time.parse(Constantes::HORAFINDIA)))||
						((Time.parse(_rodaje.hora)) >= (Time.parse(Constantes::HORAINICIOTARDE)) && (Time.parse(_rodaje.hora)) <= (Time.parse(Constantes::HORAFINTARDE)))
						#puts "Esta en hora de Pico y Placa"
						return false
					end									
				end
			end
		}
		return true
	end
end