class PointsController < InheritedResources::Base
	
	def create
      retorno = Point.save_point(params[:template], params[:id])	
      case retorno
        when 1 then @msg = "<div class='alert alert-success'> Ponto registrado com sucesso </div>"
        when 2 then @msg = "<div class='alert alert-error'> Digital nao confere </div>"
        when 3 then @msg = "<div class='alert alert-error'> Erro parametros invalidos </div>"
        else @msg = "<div class='alert alert-error'> XXXXXXXXXX </div>" 	
      end
	end

  def save_fingerprint
    retorno = Employee.save_fingerprint( params[:id], params[:template] )
    if retorno == -1
      @msg = "<div class='alert alert-erro'> Matricula nao encontrada </div>" 
    else
      @msg = "<div class='alert alert-success'> Digital atualizada com sucesso </div>"
    end
  end
end
