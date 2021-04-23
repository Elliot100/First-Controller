class UsersController < ApplicationController
    def index
        @users = User.all 
        # render json: user
        render :index
    end

    def show
        @user = User.find_by(id: params[:id])

        # render :show
        if @user
            render :show
        else
            # render :index, below is using the prefix, or can use '/users' 
            redirect_to users_url
        end
    end

    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            #show user hero show page
            redirect_to user_url(@user)
        else
            #show user the new user form
            render :new
        end

    end

    def update
        user = User.find_by(id: params[:id])

        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])

        if user.destroy
            render json: user
        else
            render json: "Cannot destroy user, too important"
        end
    end 

    private

    def user_params
        params.require(:user).permit(:name, :email, :category, :description)
    end     


end