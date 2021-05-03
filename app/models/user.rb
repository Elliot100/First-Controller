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
    validates :name, :email, presence: true
   
    # def year_not_in_future
    #     errors[:year] << "cannot be in the future" unless year > 2016
    # end

    has_many :pets
end
