class Machine < ActiveRecord::Base
  acts_as_taggable

  belongs_to :machine_template
end
