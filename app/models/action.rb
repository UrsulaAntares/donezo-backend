class Action < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :environment, optional: true
    belongs_to :conditional, optional: true
    has_many :action_tags
    has_many :tags, through: :action_tags
    has_many :action_checklists
    has_many :checklists, through: :action_checklists

end
