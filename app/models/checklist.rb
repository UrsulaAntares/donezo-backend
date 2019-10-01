class Checklist < ApplicationRecord
    has_many :deed_checklists
    has_many :deeds, through: :deed_checklists
end
