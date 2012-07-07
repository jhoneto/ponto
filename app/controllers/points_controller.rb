class PointsController < InheritedResources::Base
  load_and_authorize_resource
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

  def process_points
    unless params[:by_enterprise].nil?
      if Point.process_point(params[:by_enterprise], params[:date_start].to_date, params[:date_end].to_date)
        flash[:notice] = "Processo realizado com sucesso"
      end
    end
  end
end
