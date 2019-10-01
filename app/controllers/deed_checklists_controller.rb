class DeedChecklistsController < ApplicationController

    def create
        deed_checklist = DeedChecklist.create(deed_checklist_params)
        render json: deed_checklist.to_json(deed_checklist_serializer)
    
    end

    def show 
        deed_checklist = DeedChecklist.all.find(params[:id])
        render json: deed_checklist.to_json(deed_checklist_serializer)
    end

    def index 
        deed_checklists = DeedChecklist.all
        render json: deed_checklists.to_json(deed_checklist_serializer)
    end

    private

    def deed_checklist_params
        params.require(:checklist).permit(:deed_id, :checklist_id)
    end

    def deed_checklist_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end
end
