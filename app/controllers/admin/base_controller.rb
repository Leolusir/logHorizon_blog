module Admin
  class BaseController < ApplicationController
    layout 'admin_layout'
    before_filter :verify_admin

    private
    def verify_admin
      redirect_to new_user_session_path unless current_user
    end
  end
end
