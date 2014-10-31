class UsersController < ApplicationController
  
  require 'gcm' 

  def registerUser
      gcm = GCM.new(Rails.configuration.api_key)
      @user = User.new()
      #@name = Name.last
      @user.username = params[:username]
      @user.emailId = params[:emailId]
      @user.password = params[:password]
      @user.gcm_id = params[:gcm_id]
      respond_to do |format|
      if @user.save
        puts "                  ----------------- "+@user.password
        format.html { render "index", notice: 'User was successfully created.' }
        format.json { render :json => {:username => @user.username, :id => @user.id}, status: :created }
      else
        format.html { render :new }
        format.json { render :json => { :errors => @user.errors.full_messages } , status: :unprocessable_entity}
      end
    end
    
    options = {data: {message: "Device register"}, collapse_key: "updated_score"}
    registration_ids= []
    registration_ids.push(@user.gcm_id)
    response = gcm.send(registration_ids, options)
    puts "response: "+response.to_s
  end

end
