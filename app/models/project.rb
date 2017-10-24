class Project < ApplicationRecord
  belongs_to :user

  enum status: { pending: 0, approved: 1 }
end
