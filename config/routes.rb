Rails.application.routes.draw do
  # Routes for the Nut job account:

  # SIGN UP FORM
  get("/nut_job_sign_up", { :controller => "nut_job_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_nut_job", { :controller => "nut_job_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_nut_job_profile", { :controller => "nut_job_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_nut_job", { :controller => "nut_job_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_nut_job_account", { :controller => "nut_job_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/nut_job_sign_in", { :controller => "nut_job_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/nut_job_verify_credentials", { :controller => "nut_job_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/nut_job_sign_out", { :controller => "nut_job_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
