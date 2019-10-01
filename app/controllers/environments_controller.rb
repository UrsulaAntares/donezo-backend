class EnvironmentsController < ApplicationController

    def create
        environment = Environment.create(environment_params)
        render json: environment.to_json(environment_serializer)
    
    end

    def show 
        # environment = Environment.all.find(params[:id])

        environment = Environment.all.find_by(name: params["id"].titlecase) || Environment.all.find_by(name: params["id"])
        render json: environment.to_json(environment_serializer)
    end

    def index 
        environments = Environment.all
        render json: environments.to_json(environment_serializer)
    end

    private

    def environment_params
        params.require(:environment).permit(:name, :parent_id, :id)
    end

    def environment_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end


end
