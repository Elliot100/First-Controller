# == Schema Information
#
# Table name: pets
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  ttype      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class Pet < ApplicationRecord
    TYPE = ["dog", "cat", "hamster"]

    validates :name, :user_id, :ttype, presence: true
    validates :ttype, inclusion: TYPE

    belongs_to :user
end

