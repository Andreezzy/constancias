class Personal < ActiveRecord::Base
  belongs_to :establishment
  belongs_to :architect
end
