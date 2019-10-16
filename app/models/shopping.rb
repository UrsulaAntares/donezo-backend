class Shopping < ApplicationRecord
    has_many :deed_shoppings, dependent: :destroy
    has_many :deeds, through: :deed_shoppings
end
