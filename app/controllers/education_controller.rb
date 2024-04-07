class EducationController < ApplicationController
  before_action :is_admin?, only: [:new]

  def educational_content
    @videos = Content.where(content_type: 'video')
    @articles = Content.where(content_type: 'article')
    @infographics = Content.where(content_type: 'infographic')
    @active_page = 'education'
  end

  def new
    @content = Content.new
    @active_page = 'upload_content'
  end

  def create
    @content = Content.new(content_params)

    # Add current user id to content
    @content.user_id = current_user.id

    if @content.save
      flash[:notice] = 'Content was successfully created.'
      redirect_to educational_content_path
    else
      # Put full error
      puts @content.errors.full_messages
      render :new

    end
  end

  def update
    @content = Content.find(params[:id])

    if @content.update(content_params)
      redirect_to @content, notice: 'Content was successfully updated.'
    else
      render :new
    end
  end

  private

  def content_params
    params.require(:content).permit(:title, :description, :content_type, :content_link)
  end

  def is_admin?
    # check if user is a admin
    # if not admin then redirect to where ever you want
    redirect_to educational_content_path unless current_user.admin?
  end
end
