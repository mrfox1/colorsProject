# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
