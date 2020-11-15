class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction, :filter_by, :since

  # GET /activities
  def index
    @all_activities = Activity.all.where(user: current_user)

    #logger.info ">>>>>>"
    #logger.info since

    if sort_column == 'kcal'
      @activities =
        @all_activities.where(name: filter_by, date: since).sort_by do |a|
          Activity.get_kcal(a) * (sort_direction == 'asc' ? 1 : -1)
        end
    else
      @activities =
        @all_activities.where(name: filter_by, date: since).order(
          "#{sort_column} #{sort_direction}"
        )
    end
  end

  # GET /activities/1
  def show; end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit; end

  # POST /activities
  def create
    @user = User.find(current_user.id)
    @activity = @user.activities.create(activity_params)

    respond_to do |format|
      if @activity.save
        format.html do
          redirect_to @activity, notice: 'Activity was successfully created.'
        end
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json do
          render json: @activity.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /activities/1
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html do
          redirect_to @activity, notice: 'Activity was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json do
          render json: @activity.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html do
        redirect_to activities_url,
                    notice: 'Activity was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
    unless current_user.id == @activity.user_id
      redirect_to activities_url, alert: 'Unauthorized access!'
    end
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.require(:activity).permit(
      :name,
      :date,
      :duration,
      :rating,
      :distance
    )
  end

  def since
    if params[:since]
      params[:since].to_date..Float::INFINITY
    else
      -Float::INFINITY..Float::INFINITY
    end
  end

  def filter_by
    if Activity.names.include?(params[:by])
      Activity.names[params[:by]]
    else
      0..Float::INFINITY
    end
  end

  def sort_column
    if Activity.column_names.include?(params[:sort])
      params[:sort]
    else
      params[:sort] == 'kcal' ? 'kcal' : 'date'
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end
end
