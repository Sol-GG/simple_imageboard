class Board < ActiveRecord::Base
	validates :long_name, length: { maximum: 30 }
	VALID_EMAIL_REGEX = /\A[A-z]{1,4}\z/
  	validates :tag, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
