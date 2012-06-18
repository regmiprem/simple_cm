class CommentsController < ApplicationController
  
  layout 'admin'
  before_filter :prepare_session
  before_filter :confirm_logged_in
  def index
    @yak=Comment.all
    @ho=@yak.size
    @take=Comment.paginate(:page => params[:page], :per_page =>4).reverse_order
        #@sections = Section.visible.limit(8).order(:id).reverse_order
     #@subjects = Subject.paginate(:page => params[:page], :per_page=> 3)
    
  end
  
  def delete
    # @post = Section.find(params[:id])
    #@yak = Section.find(params[:td])
    @post = Comment.find(params[:id])
    @post.destroy
     redirect_to(:action => 'index')
   end
end
