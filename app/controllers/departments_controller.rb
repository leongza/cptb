class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(params[:department])
    if @department.save
      redirect_to @department, :notice => "Successfully created department."
    else
      render :action => 'new'
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(params[:department])
      redirect_to @department, :notice  => "Successfully updated department."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_url, :notice => "Successfully destroyed department."
  end
end
