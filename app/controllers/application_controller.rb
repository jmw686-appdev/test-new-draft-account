class ApplicationController < ActionController::Base
  before_action(:load_current_nut_job)
  
  # before_action(:force_nut_job_sign_in)
  
  def load_current_nut_job
    the_id = session[:nut_job_id]
    @current_nut_job = NutJob.where({ :id => the_id }).first
  end
  
  def force_nut_job_sign_in
    if @current_nut_job == nil
      redirect_to("/nut_job_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
