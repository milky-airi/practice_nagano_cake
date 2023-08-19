class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when Admin
      admin_root_path
    when Member
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    case resource_or_scope
    when :admin
      new_admin_session_path
    when :member
      root_path
    end
  end

end
