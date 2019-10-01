class DeedsController < ApplicationController
    skip_before_action :verify_authenticity_token


    def create
        

        deed = Deed.create(deed_params)
        if params["result_deed"] 
             Conditional.create(chore_id: deed.id, gratification_id: params["result_deed"]) 
        end
        if params["cause_deed"] 
             Conditional.create(chore_id: params["cause_deed"], gratification_id: deed.id) 
        end
        

        environment = Environment.find_or_create_by(name: params["environment"])

        tags = params["tags"].split(", ")
        tags.each do |tag| 
            newtag = Tag.find_or_create_by(name: tag)
            DeedTag.create(tag_id: newtag.id, deed_id: deed.id)
        end


        #I should work on the serialization to get the above params included
        deed.environment = environment
        deed.save

        
        render json: deed.to_json(deed_serializer)
    
    end

    def update 

        deed = Deed.all.find(params["id"])

        if params["result_deed"] 
            Conditional.create(chore_id: deed.id, gratification_id: params["result_deed"]) 
        end
        if params["cause_deed"] 
            Conditional.create(chore_id: params["cause_deed"], gratification_id: deed.id) 
        end
       

        oldDeedTags = DeedTag.select{ |dt| dt.deed_id == deed.id }
        oldDeedTags.each{|dt| dt.destroy }
        tags = params["tags"].split(", ")
        tags.each do |tag| 
            newtag = Tag.find_or_create_by(name: tag)
            DeedTag.create(tag_id: newtag.id, deed_id: deed.id)
        end
        environment = Environment.find_or_create_by(name: params["environment"])
        deed.environment = environment
        deed.save
        deed.update(deed_params)
        render json: deed.to_json(deed_serializer)

    end

    def show 
        deed = Deed.all.find(params[:id])
        render json: deed.to_json(deed_serializer)
    end

    def index 
        deeds = Deed.all
        render json: deeds.to_json(deed_serializer)
    end

    private

    def deed_params
        params.require(:deed).permit(:name, :user_id, :duration, :tags, :status, :description, :portfolio, :cause_deed, :result_deed,
         :start, :end, :duetime, :donedate, :donetime, :importance, :desirability, :supplies, :pack, :scale, :environment )
    end

    def deed_serializer
        {
            :except => [:created_at, :updated_at],
            :include => [:environment => {:except => [:created_at, :updated_at]},
                         :tags => {:except => [:created_at, :updated_at]},
                         :chores => {:only => [:id],
                                     :include => [:chore=> {:only => :name}]   
                                    },
                         :gratifications => {:only => [:id],
                                    :include => [:gratification => {:only => :name}]     
                                    },
                
                        ]
           
        }
    end

end
