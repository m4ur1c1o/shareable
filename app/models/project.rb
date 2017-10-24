class Project < ApplicationRecord
  include Placeholder
  belongs_to :user
  has_many :faqs
  enum status: { pending: 0, approved: 1 }

  validates_presence_of :title, :short_description, :description, :image

  after_initialize :set_defaults

  private

    def set_defaults
      self.image ||= Placeholder.image_generator(height: '600', width: '400')
    end
end
