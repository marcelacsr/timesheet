class TimeEntriesController < ApplicationController
  def index
    @time_entries = current_user.time_entries
    # @time_entries = TimeEntry.all
  end

  def show
    @time_entry = TimeEntry.find(params[:id])
  end

  def new
    @time_entry = TimeEntry.new
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)

    if @time_entry.save
      redirect_to @time_entry
    else
      render :new
    end
  end

  private

  def time_entry_params
    params.require(:time_entry).permit(:date)
  end
end
