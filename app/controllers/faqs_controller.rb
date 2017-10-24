class FaqsController < ApplicationController
  before_action :set_project, only: [:new, :create, :edit, :update]
  before_action :set_faq, only: [:edit, :update]

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params.merge(project_id: @project.id))

    respond_to do |format|
      if @faq.save
        format.html { redirect_to project_show_path(@project), notice: 'Your faq was created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to project_show_path(@project), notice: 'The FAQ was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

    def faq_params
      params.require(:faq).permit(:question, :answer)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_faq
      @faq = Faq.find(params[:id])
    end
end
