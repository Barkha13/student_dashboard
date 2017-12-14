class StudentsController < ApplicationController
  def index
    @dojo = Dojo.find(params[:dojo_id])
    # @students = Student.where("dojo_id='params[:id]'")
    @students = @dojo.students
  end

  def new
    @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    Student.create(student_params)
    redirect_to :back
    # session[:return_to] ||= request.referer #this is the alternate way for redirect_to
    # redirect_to session.delete(:return_to)
    
  end

  def edit
    @edit_student = Student.find(params[:student_id])
    @edit_dojo = Dojo.find(params[:dojo_id])
  end

  def update
    student = Student.find(params[:student_id])
    student.update(student_params)
    redirect_to root_url
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:student_id])
  end

  def destroy
    Student.destroy(params[:student_id])
    redirect_to :back
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
  end
end
