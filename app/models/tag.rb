class Tag < ApplicationRecord
    has_many :action_tags
    has_many :actions, through: :action_tags
end
