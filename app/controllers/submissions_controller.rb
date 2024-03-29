class SubmissionsController < ApplicationController

  layout "directory"

  filter_resource_access


  def index
    @search = Submission.search(params[:search])
    @search.meta_sort ||= 'created_at.desc'   
    if @search.count > 0
      @submissions = @search.paginate(:page => params[:page], :per_page => '4' )
      respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @submissions }
        format.js {
              render :update do |page|
                # 'page.replace' will replace full "results" block...works for this example
                # 'page.replace_html' will replace "results" inner html...useful elsewhere
                page.replace 'results', :partial => 'submissionview'
              end
          }      
        end
    else
      flash[:notice] = "Sorry, your search didn't return any results."
      redirect_to submissions_path
    end
  end


  def show
    @submission = Submission.find(params[:id])
  end


  def new
    @user = User.find(params[:user_id])
    @submission = Submission.new
  end


  def edit
    @submission = Submission.find(params[:id])
  end

 
  def create
    @user = User.find(params[:user_id])
    @submission = Submission.new(params[:submission])
    @submission.user_id = @user.id
    if @submission.save
      flash[:notice] = 'Your file has been submitted.'
      redirect_to @user
    else
        render :action => "new" 
    end
  end


  def update
    @submission = Submission.find(params[:id])
    if @submission.update_attributes(params[:submission])
        flash[:notice] = 'Submission was successfully updated.'
        redirect_to @submission
    else
        render :action => "edit" 
    end
  end

 
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to(submissions_url) }
      format.xml  { head :ok }
    end
  end
  
  
end
