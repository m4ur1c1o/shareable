class ProjectsController < ApplicationController
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

  private

    def project_params
      params.require(:project).permit(:title, :short_description, :description, :image)
    end
end
