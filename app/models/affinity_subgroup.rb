class AffinitySubgroup < ActiveRecord::Base
  attr_accessible :name

  belongs_to :affinity_group
end
