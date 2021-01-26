return if TimeEntry.exists? && User.exists?

15.times do |n|
  date = Date.today + n
  TimeEntry.create!(
      user_id: User.first.id,
      date: date,
      first_period_in: date.middle_of_day() - 3.hour,
      first_period_out: date.middle_of_day(),
      second_period_in: date.middle_of_day() + 1.hour,
      second_period_out: date.middle_of_day() + 3.hour,
      created_at: date,
      updated_at: Date.today
  )
end

puts ' time entries seed finished '
