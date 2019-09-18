class ActionTagsController < ApplicationController

    def create
        action_tag = ActionTag.create(action_tag_params)
        render json: action_tag.to_json(action_tag_serializer)
    
    end

    def show 
        action_tag = ActionTag.all.find(params[:id])
        render json: action_tag.to_json(action_tag_serializer)
    end

    def index 
        action_tags = ActionTag.all
        render json: action_tags.to_json(action_tag_serializer)
    end

    private

    def action_tag_params
        params.require(:tag).permit(:action_id, :tag_id)
    end

    def action_tag_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end

end
