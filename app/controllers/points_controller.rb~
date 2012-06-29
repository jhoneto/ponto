class PointsController < InheritedResources::Base
	
	def create
      retorno = Point.save_point(params[:template], params[:id])	
      case retorno
        when 0 then @msg = "<div class='alert alert-success'> Ponto registrado com sucesso </div>"
        when 1 then @msg = "<div class='alert alert-error'> Digital nao confere </div>"
        when 2 then @msg = "<div class='alert alert-error'> Erro parametros invalidos </div>"
        else @msg = "<div class='alert alert-error'> XXXXXXXXXX </div>" 	
      end
	end
end
