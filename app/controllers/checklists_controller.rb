class ChecklistsController < ApplicationController

  

    def create
        checklist = Checklist.create(checklist_params)
        render json: checklist.to_json(checklist_serializer)
    
    end

    def show 
        checklist = Checklist.all.find(params[:id])
        render json: checklist.to_json(checklist_serializer)
    end

    def index 
        checklists = Checklist.all
        render json: checklists.to_json(checklist_serializer)
    end

    private

    def checklist_params
        params.require(:checklist).permit(:name)
    end

    def checklist_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end



end

