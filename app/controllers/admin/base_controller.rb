module Admin
  class BaseController < ApplicationController
    before_filter :verify_admin

    private
    def verify_admin
      redirct_to root_path unless current_user
    end
  end
end
