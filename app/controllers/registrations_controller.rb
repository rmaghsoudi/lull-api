# Overriding the Devise controller action for registrations
class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    # custom method to render resources( located in the application controller )
    render_resource(resource)
  end
end