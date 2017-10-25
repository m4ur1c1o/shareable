require 'rails_helper'

RSpec.describe Faq, type: :model do
  before do
    @faq = FactoryGirl.build_stubbed(:faq)
  end

  describe 'creation' do
    it 'can be created' do
      expect(@faq).to be_valid
    end
  end

  describe 'validations' do
    it 'can not be created if not valid' do
      @faq.question = nil
      @faq.answer = nil
      expect(@faq).to_not be_valid
    end
  end
end
