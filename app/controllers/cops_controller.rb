class CopsController < ApplicationController

  def index
    @cops = Cop.search(params[:search]).joins(:departments).order(sort_column + ' ' + sort_direction).page params[:page]
  end

  def search
    @cops = Cop.search params[:search]
  end

  def show
    @cop = Cop.find(params[:id])
  end

  def new
    @cop = Cop.new
    @cop.attachments.build
  end

  def create
    @cop = Cop.new(cop_params)
    if @cop.save
      redirect_to @cop, :notice => "Successfully created cop."
    else
      render :action => 'new'
    end
  end

  def edit
    @cop = Cop.find(params[:id])
    #@cop.attachments.build
    @cop.evidences.build
  end

  def update
    @cop = Cop.find(params[:id])
    department_id = params[:cop].delete(:department_ids)
    unless department_id.blank?
      department = Department.find(department_id)
      @cop.departments << department
    end

    if @cop.update_attributes(cop_params)
      redirect_to @cop, :notice  => "Successfully updated cop."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @cop = Cop.find(params[:id])
    @cop.destroy
    redirect_to cops_url, :notice => "Successfully destroyed cop."
  end
  def cop_params
    if current_user && current_user.verified?
      params.require(:cop).permit(:lastname, :firstname, :sex, :race, :rank, :address, :city, :state, :zip, :helmet, :badge, { attachments_attributes: [ :id, :verified ]}, { departments_attributes: [ :id, :_destroy ] }, { evidences_attributes: [ :url, :id, :_destroy ]})
    end
  end

end
