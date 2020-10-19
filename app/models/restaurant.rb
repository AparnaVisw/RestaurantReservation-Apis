class Restaurant < ApplicationRecord
	validates :name, presence: true
	validates :phone, presence: true
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates_format_of :phone,
  		:with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
  		:message => " Phone numbers must be in xxx-xxx-xxxx format."
    has_many :shifts
    has_many :tables  
end
