class Conditional < ApplicationRecord
    belongs_to :chore, :class_name => "Action", :foreign_key => :chore_id
    belongs_to :gratification, :class_name => "Action", :foreign_key => :gratification_id

end
