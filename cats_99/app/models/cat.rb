# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
  includes ActionView::Helpers::DateHelper
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a valid size"}

  def age
    now = Time.now
    now.year - @birth_date.year - ((now.month > @birth_date.month || (now.month == @birth_date.month && now.day >= @birth_date.day)) ? 0 : 1)
  end


end
