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
    if params[:state].present?
      @project = Project.where('state = ?', params[:state])
    else
      @project = Project.all
    end
  end

  def project_params
    params.require(:project).permit(:name, :description, :start_on, :end_on, :state)
  end
end
