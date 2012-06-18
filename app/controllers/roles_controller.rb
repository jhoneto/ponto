class RolesController < InheritedResources::Base
	has_scope :by_description

  def index
    @roles = apply_scopes(Role).all
  end
end
