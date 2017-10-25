class PagesController < ApplicationController
  def home
    @approved_projects = Project.approved
  end
end
