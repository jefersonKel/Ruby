require './Constantes/Constantes.rb'
require 'time'
class Validacion

attr_accessor :mensaje
@constantes = Constantes.new
	#valida Formato Matricula
	def validaMatricula(matricula)
		letras = matricula[1,3].to_s
		numero = matricula[4,7].to_s
		#valida si tiene 7 o 8 caracteres
		if (matricula.length  < 7 || matricula.length > 8)
			@mensaje= "Matricula incorrecta: debe tener 7 o 8 caracteres"			
			return false
		end
		#valida si tiene '-'
		if (matricula[3].to_s) != '-'
			@mensaje= "Matricula incorrecta: 'AAA-1234'"
			return false
		end
		#valida si el ultimo caracter es numero
		if (numero.to_i < 1)
			@mensaje= "Matricula incorrecta: Los ultimos digitos deben ser numero '-4444'"
			return false
		end
		return true
	end
	
	#valida Si la fecha la fecha
	def validaFecha(fecha)
	
		if (fecha[2,1].to_s != "/" || fecha[5,1].to_s != "/")
			@mensaje= "Formato Fecha incorrecto dd/mm/aaaa"
			return false
		end 
		begin
			Date.parse(fecha)
		rescue ArgumentError
			@mensaje= "Formato Fecha incorrecto dd/mm/aaaa"
			return false
		end
		
		return true
	end
	
	
	#valida Si la hora es correcta
	def validaHora(hora)
		horas = hora[0,2].to_s
		minutos = hora[3,2].to_s
		signo = hora[2,1].to_s
		
		if ((horas.to_i < 0 )|| (horas.to_i > 24) )
			@mensaje= "Hora incorrecta: Ejemplo 00:23"
			return false
		end
		if ((minutos.to_i < 0) || (minutos.to_i > 59))
			@mensaje= "Hora incorrecta: Ejemplo 00:59"
			return false
		end
		if (signo!=":")
			@mensaje= "Hora incorrecta: Ejemplo 10:55"
			return false
		end
		return true
	end
end