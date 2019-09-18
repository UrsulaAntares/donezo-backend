class Checklist < ApplicationRecord
    has_many :action_checklists
    has_many :actions, through: :action_checklists
end
