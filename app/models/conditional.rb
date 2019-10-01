class Conditional < ApplicationRecord
    belongs_to :chore, :class_name => "Deed", :foreign_key => :chore_id
    belongs_to :gratification, :class_name => "Deed", :foreign_key => :gratification_id
    # belongs_to :deed

end
