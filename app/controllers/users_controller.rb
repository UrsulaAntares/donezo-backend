class UsersController < ApplicationController



    def create
        user = User.create(user_params)
        render json: user.to_json(user_serializer)

        # @user = User.create(user_params)

        # if @user.valid?
        #     render json: { user: UserSerializer.new(@user) }, status: :created
        #     # this does not ahve external userserializers yet
        # else
        #   render json: { error: 'failed to create user' }, status: :not_acceptable
        # end
    end

    def show 
        user = User.find_by({username: params[:id]} )
        render json: user.to_json(user_serializer)
    end

    def index 
        users = User.all
        render json: users.to_json(user_serializer)
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :birthdate)
    end

    def user_serializer
        {
            :except => [:created_at, :updated_at],
        }
    end

end
