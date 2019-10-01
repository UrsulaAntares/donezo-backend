class Deed < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :environment, optional: true
    belongs_to :conditional, optional: true
    has_many :deed_tags
    has_many :tags, through: :deed_tags
    has_many :deed_checklists
    has_many :checklists, through: :deed_checklists
    # has_many :conditionals
    has_many :gratifications, :class_name => 'Conditional', :foreign_key => 'chore_id'
    has_many :chores, :class_name => 'Conditional', :foreign_key => 'gratification_id'

end
