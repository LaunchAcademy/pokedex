class Pokemon < ActiveRecord::Base
  validates :name, presence: true
  validates :number, presence: true, uniqueness: true
  validates :poketype, presence: true
end
