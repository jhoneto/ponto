class PointsController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :html, :xml, :json
  
  has_scope :by_employee
  has_scope :by_start_date
  has_scope :by_end_date
  
  

  def index
    @points = apply_scopes(Point).paginate(:page => params[:page])
  end
  
  
  def create
    retorno = Point.save_point(params[:template], params[:id])
    puts "44444444444444444444444444"
    puts retorno
    @msg = "<div class='alert alert-success'> " + retorno + "</div>"
  end
  
  def update
    update!{ points_path }
  end
  
  def destroy
    destroy!{points_path}
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
