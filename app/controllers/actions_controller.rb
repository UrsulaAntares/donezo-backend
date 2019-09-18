class ActionsController < ApplicationController

    def create
        action = Action.create(action_params)
        render json: action.to_json(action_serializer)
    
    end

    def show 
        action = Action.all.find(params[:id])
        render json: action.to_json(action_serializer)
    end

    def index 
        actions = Action.all
        render json: actions.to_json(action_serializer)
    end

    private

    def action_params
        params.require(:action).permit(:name, :user_id, :environment_id, :duration, 
        :description, :due, :importance, :desirability, :supplies )
    end

    def action_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end

end
