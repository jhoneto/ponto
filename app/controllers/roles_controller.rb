class RolesController < InheritedResources::Base
  load_and_authorize_resource
	has_scope :by_description

  def index
    @roles = apply_scopes(Role).all
  end
end
