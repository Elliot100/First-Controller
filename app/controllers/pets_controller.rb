class PetsController < ApplicationController
    def index
        @pets = Pet.all
        render :index
    end

    def show
        @pet = Pet.find(params[:id])

        render :show
    end

    def new
        @user = User.find(params[:user_id])
        @pet = Pet.new

        render :new
    end

    def create
        @pet = Pet.new(pet_params)
        @user = @pet.user

        if @pet.save
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def destroy
        @pet = Pet.find(params[:id])
        @user = @pet.user

        if @pet.destroy
            redirect_to user_pets_url(@user)
        else
            render plain: "cannot destroy, pet too precious"
        end
    end

    private

    def pet_params
        params.require(:pet).permit(:name, :ttype, :user_id)
    end
end
