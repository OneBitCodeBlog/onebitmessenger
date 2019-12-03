class ServiceWorkersController < ApplicationController
  protect_from_forgery except: :service_worker
  skip_before_action :authenticate_user!

  def manifest
  end

  def service_worker
  end
end
