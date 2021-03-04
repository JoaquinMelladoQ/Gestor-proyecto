class ProjectController < ApplicationController
  http_basic_authenticate_with name: "gen37", password: "pass", only: :dashboard

  def index
    @project = Project.new
    @states = Project.states.keys.to_a
  end

  def create
    @project = Project.create!(project_params)
    @project.save

    redirect_to project_dashboard_url
  end

  def dashboard
    return @project = Project.all unless params.has_key?(:s) && params[:s].present?
    @project = Project.search(params[:s]) 
  end

  def project_params
    params.require(:project).permit(:name, :description, :start_on, :end_on, :state)
  end
end
