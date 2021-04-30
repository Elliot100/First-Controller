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
            # cat_url(@cat) == /cats/(id)
            redirect_to user_url(@user)
        else
            #show user the new user form
            render @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    # 1. GET /cats/new to fetch a form
    # 2. user fills out the form, click submit
    # 3. POST /cats the data in the form
    # 4. Create actions is invoked, cat is created.
    # 5. Send client a redirect to /cats/#{id}
    # 6. Client makes a GET request for /cats/#{id}
    # 7. show action for newly created cat is invoked

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
            redirect_to users_url
        else
            render json: "Cannot destroy user, too important"
        end

        # 1. GET /cats
        # 2. Click delete button
        # 3. Sends POST /cats/123; but _method="delete" so rails understands
        #      to do a destroy
        # 4. Destroys the cat. Issues a redirect to the client
        # 5. CLients gets /cats again

    end 

    private

    def user_params
        params.require(:user).permit(:name, :email, :category, :description)
    end     


end