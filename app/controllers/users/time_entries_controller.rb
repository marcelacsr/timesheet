module Users
  class TimeEntriesController < ApplicationController
    def index
      @time_entries = current_user.time_entries
    end

    def show
      @time_entry = TimeEntry.find(params[:id])
    end

    def edit; end

    def new
      @time_entry = TimeEntry.new
    end

    def create
      @user = current_user
      # binding.pry
      @time_entry = @user.time_entries.new(time_entry_params)
      if @time_entry.save
        redirect_to user_time_entries_path(@user)
      else
        render :new
      end
    end

    private

    def time_entry_params
      params.require(:time_entry).permit(:date,
                                         :first_period_in, :first_period_out,
                                         :second_period_in, :second_period_out)
    end
  end
end
