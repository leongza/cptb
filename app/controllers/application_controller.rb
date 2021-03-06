class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :sort_column, :sort_direction
  private
  def sort_column
    Cop.column_names.include?(params[:sort]) ? params[:sort] : "lastname"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
