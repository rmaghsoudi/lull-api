# Overriding the Devise controller action for registrations
class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    full_sanitizer = Rails::Html::FullSanitizer.new
    user_params = {
      email: full_sanitizer.sanitize(params[:user][:email]),
      password: full_sanitizer.sanitize(params[:user][:password]),
      first_name: full_sanitizer.sanitize(params[:user][:firstName]),
      last_name: full_sanitizer.sanitize(params[:user][:lastName])
    }
    build_resource(user_params)
    
    resource.save
    # custom method to render resources( located in the application controller )
    render_resource(resource)
  end
end