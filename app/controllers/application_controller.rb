class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?

def configure_devise_parameters
  devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:nom,:prenom,:phone,:entreprise,:siret,:regle1, :regle2,:email, :password, :password_confirmation)}
  devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:nom,:prenom,:phone,:siret,:entreprise,:regle1, :regle2, :email, :password, :password_confirmation)}
end


end
