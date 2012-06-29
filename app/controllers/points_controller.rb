class PointsController < InheritedResources::Base

  respond_to :html, :xml, :json

	
	def create
      retorno = Point.save_point(params[:template], params[:id])
      @msg = "<div class='alert alert-success'> " +retorno + "</div>"	
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
