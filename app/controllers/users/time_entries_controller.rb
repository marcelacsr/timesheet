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
      @time_entry = @user.time_entries.new(service.period_to_date)
      if @time_entry.save
        flash[:notice] = 'Atualizado'
        redirect_to root_path
      else
        render :new
      end
    end

    def update
      @time_entry = @user.time_entries.update(service.period_to_date)
      if @time_entry.save
        flash[:notice] = 'Atualizado'
        redirect_to root_path
      else
        render :new
      end
    end

    def service
      @service ||= TimeEntryServices.new(time_entry_params)
    end

    private

    def time_entry_params
      params.require(:time_entry)
            .permit([:date,
                     { first_period_in: %i[year month day hour minute],
                       first_period_out: %i[year month day hour minute],
                       second_period_in: %i[year month day hour minute],
                       second_period_out: %i[year month day hour minute] }])
    end
  end
end
