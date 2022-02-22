class User < ApplicationRecord
    has_secure_password
    has_many :requests
    has_and_belongs_to_many :chatrooms, dependent: :destroy
    has_many :volunteers 
end
