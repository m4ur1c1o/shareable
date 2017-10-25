class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, only: [:review, :toggle_status]
  before_action :set_project, only: [:edit, :update, :show, :destroy, :toggle_status, :project_belongs_to_currents_user]
  before_action :project_belongs_to_currents_user, only: [:show, :edit, :update]

  def index
    @projects = current_user.projects
  end

  def review
    @pending_projects = Project.pending
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

  def show
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was removed.' }
    end
  end

  def toggle_status
    if @project.pending?
      @project.approved!
    elsif @project.approved?
      @project.pending!
    end

    redirect_to review_projects_url, notice: 'Project status has been updated.'
  end

  private

    def project_params
      params.require(:project).permit(:title, :short_description, :description, :image)
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def admin_only
      unless current_user.admin?
        redirect_to projects_url, alert: "Access denied."
      end
    end

    def project_belongs_to_currents_user
      unless current_user.admin?
        unless current_user.projects.include?(@project)
          redirect_to projects_url, alert: "Access denied."
        end
      end
    end
end
