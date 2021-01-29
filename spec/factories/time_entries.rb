FactoryBot.define do
  factory :time_entry do
    association :user
    date { Date.today - 7.days }
    first_period_in { Date.today - 7.days }
    first_period_out { Date.today - 7.days }
    second_period_in { Date.today - 7.days }
    second_period_out { Date.today - 7.days }
    created_at { Date.today }
    updated_at { Date.today }
  end
end
