class Architect < ActiveRecord::Base
  has_many :personals
  has_many :establishments, through: :personals
end
