FactoryBot.define do
  factory :user do
    name { "user1" }
    email { "sample1@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :user_a, class: User do
    name { "user2" }
    email { "sample22@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :user_b, class: User do
    name { "user3" }
    email { "sample3@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :user_c, class: User do
    name { "user4" }
    email { "sample4@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :user_d, class: User do
    name { "user5" }
    email { "sample5@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end