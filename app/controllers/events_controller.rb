class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @user = User.find(params[:user_id])
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if set_user

      set_event
      @user = User.find(params[:user_id])
    else
      @event = Event.find(params[:id])
    end
  end

  def showevent
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit

  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)


    respond_to do |format|
      if @event.save
        format.html { redirect_to new_user_event_path(user_id:params[:user_id]), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    # byebug
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to user_event_path(@event), notice: 'Event was successfully updated.' }
        # format.json { render :show, status: :ok, location: @event }
        # redirect_to user_event_path(@event)
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_user
      if params[:user_id] == nil
        return "lol"
      else
        @user = User.find(params[:user_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :location, :description, :img_url, :user_id, :food, :booze, :cover, :price)
    end
end
