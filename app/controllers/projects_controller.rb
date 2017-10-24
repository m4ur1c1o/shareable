class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Your project was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'The project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

    def project_params
      params.require(:project).permit(:title, :short_description, :description, :image)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
