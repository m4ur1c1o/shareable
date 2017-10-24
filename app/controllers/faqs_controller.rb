class FaqsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @faq = Faq.new
  end

  def create
    @project = Project.find(params[:project_id])
    @faq = Faq.new(faq_params.merge(project_id: @project.id))

    respond_to do |format|
      if @faq.save
        format.html { redirect_to project_show_path(@project), notice: 'Your faq was created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def faq_params
      params.require(:faq).permit(:question, :answer)
    end
end
