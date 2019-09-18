class ConditionalsController < ApplicationController

    def create
        conditional = Conditional.create(conditional_params)
        render json: conditional.to_json(conditional_serializer)
    
    end

    def show 
        conditional = Conditional.all.find(params[:id])
        render json: conditional.to_json(conditional_serializer)
    end

    def index 
        conditionals = Conditional.all
        render json: conditionals.to_json(conditional_serializer)
    end

    private

    def conditional_params
        params.require(:conditional).permit(:chore_id, :gratification_id)
    end

    def conditional_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end

end
