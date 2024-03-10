class EducationController < ApplicationController
  before_action :is_admin?, only: [:new]

  def new
    @content = Content.new
  end
  
  def create
    @content = Content.new(content_params)
  
    if @content.save
      redirect_to contents_path, notice: 'Content was successfully created.'
    else
      render :new
    end
  end
  
  private
  
  def content_params
    params.require(:content).permit(:title, :description, :content_type, :content_link)
  end

  def educational_content
    
    @videos = Content.where(content_type: 'video')
    @articles = Content.where(content_type: 'article')
    @infographics = Content.where(content_type: 'infographic')
  end

  
  def is_admin?
    # check if user is a admin
    # if not admin then redirect to where ever you want 
    redirect_to educational_content_path unless current_user.admin? 
  end
end
