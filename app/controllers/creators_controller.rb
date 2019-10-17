class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show, :edit, :update, :destroy]

  # GET /creators
  # GET /creators.json
  def index
    @creators = Creator.all.order(id: :desc)
    authorize @creators
  end

  # GET /creators/1
  # GET /creators/1.json
  def show
    @creator = Creator.find(params[:id])
    authorize @creator
  end

  # GET /creators/new
  def new
    @creator = Creator.find_by(user_id: current_user.id)

    if @creator.nil?
      @creator = Creator.new
      authorize @creator
    else
      redirect_to panel_index_path
    end
  end

  # GET /creators/1/edit
  def edit
    @creator = Creator.find(params[:id])
    authorize @creator
  end

  # POST /creators
  # POST /creators.json
  def create
    @creator = Creator.new(creator_params)
    if @creator.user_id.nil?
      @creator.user_id = current_user.id
    end

    respond_to do |format|
      if @creator.save
        format.html { redirect_to @creator, notice: 'Creator was successfully created.' }
        format.json { render :show, status: :created, location: @creator }
      else
        format.html { render :new }
        format.json { render json: @creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creators/1
  # PATCH/PUT /creators/1.json
  def update
    respond_to do |format|
      if @creator.update(creator_params)
        begin
          if @creator.approved?
            @user = User.find(@creator.user_id)
            if !@user.admin?
              @user.role_id = "creator"
              CreatorMailer.confirm(@user).deliver_now
            end
            @user.save!
          end
        rescue
          #nada aqui
        end

        format.html { redirect_to @creator, notice: 'Creator was successfully updated.' }
        format.json { render :show, status: :ok, location: @creator }
      else
        format.html { render :edit }
        format.json { render json: @creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creators/1
  # DELETE /creators/1.json
  def destroy
    @creator.destroy
    respond_to do |format|
      format.html { redirect_to creators_url, notice: 'Creator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator
      @creator = Creator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creator_params
      params.require(:creator).permit!
    end
end
