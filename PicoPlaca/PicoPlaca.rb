require './Logica/Rodaje.rb'
require './Logica/Validacion.rb'
require 'time'


	@rodaje = Rodaje.new
	@validarDatos = Validacion.new
	@datoCorrecto = false
	@dia = Time.now

	puts "**********************************************************************"
	puts "Bienvenidos Sistema de verificacion PICO Y PLACA de la ciudad de Quito"
	puts "**********************************************************************"
	puts ""
	puts "Los horarios de prohibicion de circulacion son:"
	puts " de 07:00 a las 9:30 en la mañana"
	puts " de 16:00 a 19:30 en la tarde"
	puts ""
	puts "El ultimo digito de la matricula no pueden circular en los siguientes dias:"
	puts "– Lunes:	1 y 2"
	puts "– Martes: 	3 y 4"
	puts "– Miércoles: 	5 y 6"
	puts "– Jueves: 	7 y 8"
	puts "– Viernes: 	9 y 0"
	puts ""
	puts ""
	
	
	
	# método Ingresar Matricula
	def ingresarMatricula   
		while @datoCorrecto == false 
			puts "Ingrese Matricula Ejemplo MBB-4567:"
			@rodaje.matricula = gets.chomp
			puts ""
			@datoCorrecto = @validarDatos.validaMatricula(@rodaje.matricula)
			if !@datoCorrecto
				puts(@validarDatos.mensaje)
			end
		end
		@datoCorrecto = false
	end 

	# método Ingresar Fecha
	def ingresarFecha
		while @datoCorrecto == false
			puts "Ingrese fecha Ejemplo 29/11/2016(dd/mm/yyyy):"
			@rodaje.fecha = gets.chomp
			
			puts ""
			@datoCorrecto = @validarDatos.validaFecha(@rodaje.fecha)
			if !@datoCorrecto
				puts(@validarDatos.mensaje)
			end
		end
		@datoCorrecto = false
	end
	 
	 # método Ingresar Hora
	 def ingresarHora
		while @datoCorrecto == false
			puts "Ingrese Hora 00:00 - 23:59 (hh:mm)"
			@rodaje.hora = Time.new 
			@rodaje.hora = gets.chomp
			puts ""
			@datoCorrecto = @validarDatos.validaHora(@rodaje.hora)
			if !@datoCorrecto
				puts(@validarDatos.mensaje)
			end	
		end
		@datoCorrecto = false
	end
	
	ingresarMatricula
	ingresarFecha
	ingresarHora
	@datoCorrecto=@rodaje.validaRodaje(@rodaje)


	puts ""
	puts "------Datos ingresados -------"
	puts "Hora:		"+@rodaje.hora.to_s
	puts "Dia:		"+@rodaje.fecha
	puts "Ultimo digito:	"+@rodaje.matricula.reverse[0,1].to_s
	puts ""

	if(@datoCorrecto)
		puts ""
		puts "Su vehiculo puede circular por las calles de quito sin problema (-:"
		puts ""
	else
		puts ""
		puts "ALERTA..!!! Su vehiculo NO puede circular por las calles )-:"
		puts ""
	end




