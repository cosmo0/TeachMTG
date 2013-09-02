FactoryGirl.define do
  factory :deck do
    title    "This is a test deck"
    slug     "test-deck"
    category "B"
  end

  factory :user do
    email                 "john.doe@example.com"
    password              "P4ssW0Rd"
    password_confirmation "P4ssW0Rd"
    provider              "google_oauth2"
    uid                   "1234567890"
  end
end