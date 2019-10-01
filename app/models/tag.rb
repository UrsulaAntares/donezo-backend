class Tag < ApplicationRecord
    has_many :deed_tags
    has_many :deeds, through: :deed_tags
end
