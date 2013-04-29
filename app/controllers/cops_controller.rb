class CopsController < ApplicationController
  def index
    @cops = Cop.all
  end

  def show
    @cop = Cop.find(params[:id])
  end

  def new
    @cop = Cop.new
    @cop.attachments.build
  end

  def create
    @cop = Cop.new(params[:cop])
    if @cop.save
      redirect_to @cop, :notice => "Successfully created cop."
    else
      render :action => 'new'
    end
  end

  def edit
    @cop = Cop.find(params[:id])
    @cop.attachments.build
    @cop.evidences.build
  end

  def update
    @cop = Cop.find(params[:id])
    department_id = params[:cop].delete(:department_ids)
    unless department_id.blank?
      department = Department.find(department_id)
      @cop.departments << department
    end

    if @cop.update_attributes(params[:cop])
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
end
