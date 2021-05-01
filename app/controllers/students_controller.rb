class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
  end

  def update
    if set_student.active == false
      set_student.update(:active => true)
    elsif set_student.active == true
      set_student.update(:active => false)
    end
    redirect_to "/students/#{set_student[:id]}"
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end