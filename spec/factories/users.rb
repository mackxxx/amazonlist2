FactoryBot.define do
  factory :user do
    name { "user1" }
    email { "sample1@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :other_user, class: User do
    name { "user2" }
    email { "sample3@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :other_users, class: User do
    name { "user3" }
    email { "sample4@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :the_other_user, class: User do
    name { "user4" }
    email { "sample5@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end