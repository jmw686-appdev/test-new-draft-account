class NutJobAuthenticationController < ApplicationController
  # skip_before_action(:force_nut_job_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "nut_job_authentication/sign_in.html.erb" })
  end

  def create_cookie
    nut_job = NutJob.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if nut_job != nil
      are_they_legit = nut_job.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/nut_job_sign_in", { :alert => "Incorrect password." })
      else
        session[:nut_job_id] = nut_job.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/nut_job_sign_in", { :alert => "No nut_job with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "nut_job_authentication/sign_up.html.erb" })
  end

  def create
    @nut_job = NutJob.new
    @nut_job.password = params.fetch("query_password")
    @nut_job.password_confirmation = params.fetch("query_password_confirmation")
    @nut_job.email = params.fetch("query_email")
    @nut_job.password = params.fetch("query_password")
    @nut_job.crazy = params.fetch("query_crazy")

    save_status = @nut_job.save

    if save_status == true
      session[:nut_job_id] = @nut_job.id
   
      redirect_to("/", { :notice => "Nut job account created successfully."})
    else
      redirect_to("/nut_job_sign_up", { :alert => "Nut job account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "nut_job_authentication/edit_profile.html.erb" })
  end

  def update
    @nut_job = @current_nut_job
    @nut_job.password = params.fetch("query_password")
    @nut_job.password_confirmation = params.fetch("query_password_confirmation")
    @nut_job.email = params.fetch("query_email")
    @nut_job.password = params.fetch("query_password")
    @nut_job.crazy = params.fetch("query_crazy")
    
    if @nut_job.valid?
      @nut_job.save

      redirect_to("/", { :notice => "Nut job account updated successfully."})
    else
      render({ :template => "nut_job_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_nut_job.destroy
    reset_session
    
    redirect_to("/", { :notice => "NutJob account cancelled" })
  end
 
end
