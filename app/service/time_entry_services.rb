class TimeEntryServices
  attr_reader :first_period_in, :first_period_out, :second_period_in, :second_period_out

  def initialize(params)
    @date = params[:date]
    @first_period_in = params[:first_period_in]
    @first_period_out = params[:first_period_out]
    @second_period_in = params[:second_period_in]
    @second_period_out = params[:second_period_out]
    @periods = [first_period_in.to_h, first_period_out.to_h, second_period_in.to_h, second_period_out.to_h]
  end

  def period_to_date
    periods = format_to_datetime(@periods)
    { date: @date,
      first_period_in: periods[0],
      first_period_out: periods[1],
      second_period_in: periods[2],
      second_period_out: periods[3] }
  end

  private

  def format_to_datetime(periods)
    dates = []
    periods.each do |period|
      dates << to_date(period)
    end
    dates
  end

  def to_date(period)
    Time.new(period[:year].to_i, period[:month].to_i, period[:day].to_i, period[:hour].to_i, period[:minute].to_i)
  end
end
