# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  category    :string
#  description :text
#  email       :string           not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
end
