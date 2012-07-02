class Admin::UsersController < AdminController

    include Transactions

    before_filter :user_log

    respond_to :html, :xml, :json


    # GET /users
    # GET /users.json
    def index
        @users = User.all
        respond_with(@users)
    end

    # GET /users/1
    # GET /users/1.json
    def show
        @user = User.find(params[:id])
        respond_with(@user)
    end

    # GET /users/new
    # GET /users/new.json
    def new
        @user = User.new
        @action_url = admin_users_path
        render :form
    end

    # GET /users/1/edit
    def edit
        @user = User.find(params[:id])
        @action_url = admin_user_path(@user)
        render :form
    end

    # GET /users/1/edit
    # POST /users
    # POST /users.json
    def create
        @user = create_it(User, params)
        if @user.id.nil?
            respond_to do |format|
                format.html { render action: :index }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        else
            respond_to do |format|
                format.html { redirect_to admin_user_path(@user), notice: t('user.created') }
                format.json { render json: admin_user_path(@user), status: :created, location: @user }
            end
        end
    end

    # PUT /users/1
    # PUT /users/1.json
    def update

        @user = User.find(params[:id])

        respond_to do |format|
            if @user.update_attributes(params[:user])
                format.html { redirect_to admin_user_path(@user), notice: t('user.updated') }
                format.json { head :ok }
            else
                format.html { render action: t('edit') }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to action: :index
    end

    protected

    def user_log
        logger.info ">>>>>>> #{action_name}"
    end
end
