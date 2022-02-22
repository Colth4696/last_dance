class Chatroom < ApplicationRecord
  has_and_belongs_to_many :requests
  has_and_belongs_to_many :volunteers
  has_many :messages, dependent: :destroy
end
