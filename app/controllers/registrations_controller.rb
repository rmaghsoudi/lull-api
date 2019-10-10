# Overriding the Devise controller action for registrations
class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user_params = {
      email: params[:user][:email],
      password: params[:user][:password],
      first_name: params[:user][:fullName].split(' ').first,
      last_name: params[:user][:fullName].split(' ').last
    }
    build_resource(user_params)
    
    resource.save
    # custom method to render resources( located in the application controller )
    render_resource(resource)
  end
end