class Project < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, approved: 1 }

  validates_presence_of :title, :short_description, :description
end
