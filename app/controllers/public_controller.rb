class PublicController < ApplicationController
  http_basic_authenticate_with :name => "prem", :password => "prem", :only => :delete
  layout 'public'
  before_filter :setup_navigation
  def index
    # intro text
  end
  def com
    @post =Section.find(params[:id])
    @comment=@post.comments.create(params[:comment])
    if @comment.save
    
      # If save succeeds, redirect to the list action
      flash[:notice] = "comment saved."
      redirect_to(:action => 'shows', :id=> @post)
       #redirect_to(:action => 'list', :subject_id => @page.subject_id)
    else
      # If save fails, redisplay the form so user can fix problems
     
      flash[:notice]= "error in form validation"
     redirect_to(:action => 'shows', :id=> @post)
    end
    

  end
   def delete
    # @post = Section.find(params[:id])
    @yak = Section.find(params[:td])
    @post = Comment.find(params[:id])
    @post.destroy
     redirect_to(:action => 'shows', :id=> @yak)
   # @comment.destroy

  end
  def show
  
  
   @page = Page.where(:permalink => params[:id], :visible => true).first
   @take = @page.sections.visible.sorted.paginate(:page => params[:page], :per_page=> 1)

    #@page = Page.where(:permalink => params[:id], :visible => true)
    redirect_to(:action => 'index') unless @take
  end
  def shows
   
   @page = Section.find(params[:id])
   #@comment = @page.comments.create(params[:comment])
   
   #@take = Section.where(:id => params[:id])
  #@take = @page.paginate(:page => params[:page], :per_page=> 1)

    #@page = Page.where(:permalink => params[:id], :visible => true)
    #redirect_to(:action => 'index') unless @page
  end
  
  
  private
  def setup_navigation
    @subjects = Subject.visible.sorted
    @sections = Section.visible.limit(8).order(:id).reverse_order
    
  end
  
end
