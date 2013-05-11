class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
    @cops = @department.cops.order(sort_column + ' ' + sort_direction).page params[:page]
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
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
    if @department.update_attributes(department_params)
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

  private

    def department_params
      if current_user && current_user.verified?
        params.require(:department).permit(:name, :address, :city, :state, :postalcode, :phone, :logo)
      end
    end
end
