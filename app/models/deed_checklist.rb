class DeedChecklist < ApplicationRecord
    belongs_to :deed
    belongs_to :checklist 
end
