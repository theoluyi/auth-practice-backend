class User < ApplicationRecord
    validates :username, uniqueness: true
    validates :username, presence: true
    has_many :snacks
    has_secure_password
    # need has_secure_password if we want to hash pw
    # has secure password comes with its own validations
end
