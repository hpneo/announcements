class AnnouncementsController < ApplicationController
  unloadable

  before_filter :set_current_semester
  before_filter :check_permissions

  def index
    @announcements = Announcement.where(semester: @current_semester)
  end

  def create
    @announcement = Announcement.new
    @announcement.title = params[:announcement][:title]
    @announcement.content = params[:announcement][:content]
    @announcement.user_id = User.current.id
    @announcement.semester = Announcement.current_semester

    if @announcement.save
      render :create
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_current_semester
    @current_semester = params[:semester] || Announcement.current_semester
  end
  
  def check_permissions
    (render_403; return false) unless User.current.allowed_to?(:view_announcements, nil, global: true)
  end
end
