class ActionChecklistsController < ApplicationController

    def create
        action_checklist = ActionChecklist.create(action_checklist_params)
        render json: action_checklist.to_json(action_checklist_serializer)
    
    end

    def show 
        action_checklist = ActionChecklist.all.find(params[:id])
        render json: action_checklist.to_json(action_checklist_serializer)
    end

    def index 
        action_checklists = ActionChecklist.all
        render json: action_checklists.to_json(action_checklist_serializer)
    end

    private

    def action_checklist_params
        params.require(:checklist).permit(:action_id, :checklist_id)
    end

    def action_checklist_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end
end
