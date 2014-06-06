class AnnouncementsController < ApplicationController
  unloadable

  before_filter :set_current_semester
  before_filter :check_permissions
  before_filter :check_ownership, only: [ :destroy ]

  def index
    @announcements = Announcement.where(semester: @current_semester).order('created_at DESC')
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
    @announcement = Announcement.find(params[:id])
    @announcement.title = params[:announcement][:title]
    @announcement.content = params[:announcement][:content]

    if @announcement.save
      render :update
    end
  end

  def destroy
    @announcement ||= Announcement.find(params[:id])

    if @announcement.destroy
      render :destroy
    end
  end

  private

  def set_current_semester
    @current_semester = params[:semester] || Announcement.current_semester
  end
  
  def check_permissions
    (render_403; return false) unless User.current.allowed_to?(:view_announcements, nil, global: true)
  end

  def check_ownership
    @announcement = Announcement.find(params[:id])

    (render_403; return false) unless @announcement.user_id == User.current.id
  end
end
