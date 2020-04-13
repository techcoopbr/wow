class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  require 'httparty'

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def steam_game_request

    p ENV['STEAM_API_KEY']

    app_list_response = HTTParty.get("#{ENV['APP_LIST_STEAM_API_URL']}")
    app_list = app_list_response.parsed_response["applist"]["apps"]

    app_list.each do |g|
      app_name = g["name"]
      app_id = g["appid"].to_s

      if !Game.find_by(name: app_name)

        app_details_response = HTTParty.get("#{ENV['APP_DETAIL_STEAM_API_URL']}" + app_id)
        app_details = app_details_response.parsed_response[app_id]["data"]

        if app_details
          if app_details["type"] == "game"
            game = Game.new

            game.name               = app_details["name"]
            game.source             = "steam"
            game.source_id          = app_details["steam_appid"]
            game.description        = app_details["detailed_description"]
            game.about              = app_details["about_the_game"]
            game.short_description  = app_details["short_description"]

            if app_details["developers"]
              app_details["developers"].each do |dev|
                if game.developers
                  game.developers += ", #{dev}"
                else
                  game.developers = dev
                end
              end
            end

            if app_details["publishers"]
              app_details["publishers"].each do |pub|
                if game.publishers
                  game.publishers += ", #{pub}"
                else
                  game.publishers = pub
                end
              end
            end

            game.save
          end
        end

        sleep(1.3)

      end

    end

    redirect_to games_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :description, :about, :photo)
    end
end
