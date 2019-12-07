class ShoppingsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        shopping = Shopping.create(shopping_params)
        render json: shopping.to_json(shopping_serializer)
    
    end



    def destroy

        shopping = Shopping.find(params["id"])
        shopping.destroy
    end

    def show 
        

        shopping = Shopping.all.find_by(title: params["id"].titlecase) || Shopping.all.find_by(title: params["id"])

        render json: shopping.to_json(shopping_serializer)
    end

    def index 
        shoppings = Shopping.all
        render json: shoppings.to_json(shopping_serializer)
    end



    private

    def shopping_params
        params.require(:shopping).permit(:title, :parent_id,  :id)
    end

    def shopping_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end
end
