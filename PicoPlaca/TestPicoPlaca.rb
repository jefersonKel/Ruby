require_relative "./Logica/Validacion"
require_relative './Logica/Rodaje'
require "test/unit"

class TestPicoPlaca < Test::Unit::TestCase
	def test_simple
		validarDatos = Validacion.new
		rodaje = Rodaje.new
		rodaje.matricula="MBB-1235"
		rodaje.fecha="29/11/2016"
		rodaje.hora="17:29"
		
		assert_equal(true, validarDatos.validaMatricula(rodaje.matricula) )
		assert_equal(true, validarDatos.validaFecha(rodaje.fecha) )
		assert_equal(true, validarDatos.validaHora(rodaje.hora) )
		assert_equal(true, rodaje.validaRodaje(rodaje) )
  end
end
 

