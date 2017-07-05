class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @is_active = ""
    if @student.active == false
      @is_active = "This student is currently inactive."
    else
      @is_active = "This student is currently active."
    end
  end

  def activate
    @student = Student.find(params[:id])
    @student.update!(active: !@student.active)
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
