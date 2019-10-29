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

        if params["tags"]
            tags = params["tags"].split(", ")
            tags.each do |tag| 
                newtag = Tag.find_or_create_by(name: tag)
                DeedTag.create(tag_id: newtag.id, deed_id: deed.id)
            end
        end

        if params["shoppings"]
            shoppings = params["shoppings"].split(", ")
            shoppings.each do |shopping| 
                newshop = Shopping.find_or_create_by(title: shopping)
                DeedShopping.create(shopping_id: newshop.id, deed_id: deed.id)
            end
        end

 

        #I should work on the serialization to get the above params included
        deed.environment = environment
        deed.save

        
        render json: deed.to_json(deed_serializer)
    
    end

    def update 

        deed = Deed.all.find(params["id"])
   
        if deed_params["status"] == "Donezo"
            deed.start = Date.today
            deed.end = Date.today
            deed.save
        end

        if params["result_deed"] 
            Conditional.create(chore_id: deed.id, gratification_id: params["result_deed"]) 
        end
        if params["cause_deed"] 
            Conditional.create(chore_id: params["cause_deed"], gratification_id: deed.id) 
        end
       

        oldDeedTags = DeedTag.select{ |dt| dt.deed_id == deed.id }
        oldDeedTags.each{|dt| dt.destroy }
        if params["tags"]
            tags = params["tags"].split(", ")
            tags.each do |tag| 
                newtag = Tag.find_or_create_by(name: tag)
                DeedTag.create(tag_id: newtag.id, deed_id: deed.id)
            end
        end


        oldDeedShoppings = DeedShopping.select{ |ds| ds.deed_id == deed.id }
        oldDeedShoppings.each{|ds| ds.destroy }

        if params["shoppings"]
            shoppings = params["shoppings"].split(", ")
            shoppings.each do |shopping| 
                newshop = Shopping.find_or_create_by(title: shopping)
                DeedShopping.create(shopping_id: newshop.id, deed_id: deed.id)
            end
        end



        if params["environment_name"]
            environment = Environment.find_or_create_by(name: params["environment_name"])

            deed.environment = environment
        end

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
        params.require(:deed).permit(:title, :user_id, :duration, :tags, :status, 
        :description, :portfolio, :cause_deed, :result_deed, :shoppings,
        :start, :end, :duetime, :donedate, :donetime, :importance, :desirability, 
        :supplies, :pack, :scale, :environment, :environment_name )
    end

    def deed_serializer
        {
            :except => [:created_at, :updated_at],
            :include => [:environment => {:except => [:created_at, :updated_at]},
                         :tags => {:except => [:created_at, :updated_at]},
                         :shoppings => {:except => [:created_at, :updated_at]},
                         :chores => {:only => [:id],
                                     :include => [:chore=> {:only => [:title, :id]}]   
                                    },
                         :gratifications => {:only => [:id],
                                    :include => [:gratification => {:only => [:title, :id]}]     
                                    },
                
                        ]
           
        }
    end

end
