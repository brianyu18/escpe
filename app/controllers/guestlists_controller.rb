class GuestlistsController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /guestlists
  # GET /guestlists.json
  def index
    byebug
    @guestlists = Guestlist.all

  end

  # GET /guestlists/1
  # GET /guestlists/1.json
  def show
    set_guestlist
  end

  # GET /guestlists/new
  def new
    @guestlist = Guestlist.new
  end

  # GET /guestlists/1/edit
  def edit
  end

  # POST /guestlists
  # POST /guestlists.json
  def create
    # byebug
    @guestlist = Guestlist.new(user_id:params[:user_id], event_id:params[:event_id])

    respond_to do |format|
      if @guestlist.save
        format.html { redirect_to user_events_path(user_id: @guestlist.user_id), notice: 'Guestlist was successfully created.' }
        format.json { render :show, status: :created, location: @guestlist }
      else
        format.html { render :new }
        format.json { render json: @guestlist.errors, status: :unprocessable_entity }
      end
      # redirect_to user_events_path(user_id: @guestlist.user_id)
    end
  end

  # PATCH/PUT /guestlists/1
  # PATCH/PUT /guestlists/1.json
  def update

    respond_to do |format|
      if @guestlist.update(guestlist_params)
        format.html { redirect_to @guestlist, notice: 'Guestlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @guestlist }
      else
        format.html { render :edit }
        format.json { render json: @guestlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guestlists/1
  # DELETE /guestlists/1.json
  def destroy
    @guestlist.destroy
    respond_to do |format|
      format.html { redirect_to guestlists_url, notice: 'Guestlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guestlist
      @guestlist = Guestlist.find(params[:id])
    end

    def set_user
      @User = User.find(params[:id])
    end

    def set_event
      @Event = Event.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def guestlist_params
      params.require(:guestlist).permit(:user_id, :event_id)
    end
end
