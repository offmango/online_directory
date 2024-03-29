class PrintAgreementsController < ApplicationController


  #Gets user ID from routing and converts it to an @user object using get_user
  before_filter :get_user

  before_filter :unregistered_user

  filter_resource_access

  layout "directory"

  def index
    @print_agreements = @user.print_agreements
  end

  def show
    @print_agreement = @user.print_agreements.find(params[:id])
  end

  def new
    @print_agreement = @user.print_agreements.build
  end

  def edit
    @print_agreement = @user.print_agreements.find(params[:id])
  end

  def create
    @print_agreement = @user.print_agreements.build(params[:print_agreement])
    @print_agreement.print_agree_date = Time.now
    @print_agreement.semester = current_semester
    if @print_agreement.save
      @user.print_agreement_id = @print_agreement.id
      @user.last_print_agree_semester = current_semester
      @user.save
      flash[:notice] = 'You are now registered to use the Architecture printers and plotters.'
      redirect_to(@user)
    else
      render :action => "new" 
    end
  end

  def update
    @print_agreement = @user.print_agreements.find(params[:id])
    if @print_agreement.update_attributes(params[:print_agreement])
      flash[:notice] = 'Print agreement was successfully updated.'
      redirect_to(@user) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @print_agreement = @user.print_agreements.find(params[:id])
    @user.print_agreement_id = nil
    @user.last_print_agree_semester = nil
    @user.save
    @print_agreement.destroy
    flash[:notice] = 'Print agreement was successfully destroyed.'
    redirect_to(@user) 
  end
  
  private

   def get_user
     @user = User.find(params[:user_id])
   end
end
