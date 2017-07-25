class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_enrollment

  def show
    
  end

  private

  def verify_enrollment
    if current_user.enrolled_in?(current_lesson.section.course)
      show
    else
      redirect_to course_path(current_lesson.section.course), alert: 'You need to be enrolled in order to see this content'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
