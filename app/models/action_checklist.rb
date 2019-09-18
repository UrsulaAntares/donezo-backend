class ActionChecklist < ApplicationRecord
    belongs_to :action
    belongs_to :checklist 
end
