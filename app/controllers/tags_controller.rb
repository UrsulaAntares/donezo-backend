class TagsController < ApplicationController

    def create
        tag = Tag.create(tag_params)
        render json: tag.to_json(tag_serializer)
    
    end

    def show 
        tag = Tag.all.find(params[:id])
        render json: tag.to_json(tag_serializer)
    end

    def index 
        tags = Tag.all
        render json: tags.to_json(tag_serializer)
    end

    private

    def tag_params
        params.require(:tag).permit(:name, :parent_id)
    end

    def tag_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end



end
