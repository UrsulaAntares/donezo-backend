class DeedTagsController < ApplicationController

    def create
        deed_tag = DeedTag.create(deed_tag_params)
        render json: deed_tag.to_json(deed_tag_serializer)
    
    end

    def show 
        deed_tag = DeedTag.all.find(params[:id])
        render json: deed_tag.to_json(deed_tag_serializer)
    end

    def index 
        deed_tags = DeedTag.all
        render json: deed_tags.to_json(deed_tag_serializer)
    end

    private

    def deed_tag_params
        params.require(:tag).permit(:deed_id, :tag_id)
    end

    def deed_tag_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end

end
