class Personal < ActiveRecord::Base
  belongs_to :establishment
  belongs_to :architect
  accepts_nested_attributes_for :architect
end
