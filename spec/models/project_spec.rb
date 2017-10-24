require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'creation' do
    it 'can be created' do
      project = FactoryGirl.build_stubbed(:project)
      expect(project).to be_valid
    end
  end

  describe 'validations' do
    before { @project = FactoryGirl.build_stubbed(:project) }

    it 'can be created if valid' do
      @project.title = nil
      @project.short_description = nil
      @project.description = nil
      expect(@project).to_not be_valid
    end
  end
end
