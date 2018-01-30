class RegistrationsController < Devise::RegistrationsController

  protected

  # This controller exists only to override the default behaviour of
  # devise which requires a password to be specified when updating a profile
  def update_resource(resource, params)
    params.delete(:username)
    resource.update(params)
  end
end
