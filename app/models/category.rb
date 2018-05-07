# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_mood :string
#

class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true
end
