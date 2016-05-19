# This will guess the User class
FactoryGirl.define do
  factory :user do
    name "John Fahey"
    sequence(:email, 1000) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
    current_sign_in_at Time.now
  end

  factory :artist do
    user
    sequence(:name, 1000) { |n| "Artist#{n}" }
  end

  factory :album do
    user
    artist
    sequence(:name, 1000) { |n| "Album#{n}" }
  end

  factory :song do
    user
    album
    sequence(:name, 1000) { |n| "Song#{n}" }
  end
end

# | users | CREATE TABLE `users` (
#   `id` int(11) NOT NULL AUTO_INCREMENT,
#   `name` varchar(255) DEFAULT NULL,
#   `email` varchar(255) NOT NULL DEFAULT '',
#   `encrypted_password` varchar(255) NOT NULL DEFAULT '',
#   `reset_password_token` varchar(255) DEFAULT NULL,
#   `reset_password_sent_at` datetime DEFAULT NULL,
#   `remember_created_at` datetime DEFAULT NULL,
#   `sign_in_count` int(11) NOT NULL DEFAULT '0',
#   `current_sign_in_at` datetime DEFAULT NULL,
#   `last_sign_in_at` datetime DEFAULT NULL,
#   `current_sign_in_ip` varchar(255) DEFAULT NULL,
#   `last_sign_in_ip` varchar(255) DEFAULT NULL,
#   `created_at` datetime NOT NULL,
#   `updated_at` datetime NOT NULL,
#   PRIMARY KEY (`id`),
#   UNIQUE KEY `index_users_on_email` (`email`),
#   UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
# ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 |