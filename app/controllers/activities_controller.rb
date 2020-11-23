class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[show edit update destroy]
  helper_method :sort_column, :sort_direction, :filter_by, :since

  # GET /activities
  def index
    @all_activities = Activity.all.where(user: current_user)
    @chart_activities = @all_activities.where(name: filter_by, date: since)
    @activities =
      if sort_column != 'kcal'
        @chart_activities.order("#{sort_column} #{sort_direction}")
      else
        @chart_activities.sort_by do |a|
          a.kcal * (sort_direction == 'asc' ? 1 : -1)
        end
      end
  end

  # GET /activities/1
  def show
    @comparable_activities =
      Activity.all.where(
        user: current_user,
        name: @activity.name,
        date: '0001-01-01 00:00:00'..@activity.date.to_datetime
      )
    @previous_activity = @comparable_activities.where.not(id: @activity.id).last
  end

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
    unless @activity.date.blank?
      # We can omit that for now, the form will throw an error anyway!
      @activity.date =
        DateTime.new(
          @activity.date.year,
          @activity.date.month,
          @activity.date.day,
          Time.now.hour,
          Time.now.min,
          Time.now.sec,
          Time.now.zone
        )
    end

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
      # Update date manipulation intended to maintain original creation time
      p_date =
        activity_params[:date].to_date
      updated_date =
        DateTime.new(
          p_date.year,
          p_date.month,
          p_date.day,
          @activity.date.hour,
          @activity.date.min,
          @activity.date.sec,
          @activity.date.zone
        )
      if @activity.update(activity_params) &&
           @activity.update_attribute(:date, updated_date)
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
