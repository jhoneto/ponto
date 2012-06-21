class EnterprisesController < InheritedResources::Base
  
  has_scope :by_name

  def index
    @enterprises = apply_scopes(Enterprise).all
  end
  
end
