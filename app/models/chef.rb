class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  before_save {self.email = email.downcase}
  validates :chefname , presence: true , length: {minimum:3 , maximum:40}
  VALID_EMAIL_REGEX =  /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
  validates :email,presence: true, length: { maximum: 105},
                                    uniqueness: {case_sensitive: false},
                                    format: {with: VALID_EMAIL_REGEX }
end