FactoryGirl.define do
  factory :user do
    name     "Crazy Dude"
    email    "crazy@dude.com"
    password "foobar"
    password_confirmation "foobar"
  end
end