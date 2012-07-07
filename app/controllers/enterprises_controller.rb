class EnterprisesController < InheritedResources::Base
  load_and_authorize_resource
  
  has_scope :by_name

  def index
    @enterprises = apply_scopes(Enterprise).all
  end
  
end
