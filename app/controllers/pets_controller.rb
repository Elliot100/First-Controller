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
        @pet = Pet.new

        render :new
    end

    def create
        @pet = Pet.new(pet_params)

        if @pet.save
            redirect_to pet_url(@pet)
        else
            render :new
        end
    end

    def destroy
        @pet = Pet.find(params[:id])

        if @pet.destroy
            redirect_to pets_url
        else
            render plain: "cannot destroy, pet too precious"
        end
    end

    private

    def pet_params
        params.require(:pet).permit(:name)
    end
end
