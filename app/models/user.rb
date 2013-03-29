# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
    attr_accessible :name, :email, :password, :password_confirmation
    # Adds the password and password_confirmation attrs, requires the
    # presence of the password, requires that they match, and adds an
    # authenticate method to compare an encrypted password to the
    # password_digest to authenticate users. All that for free with
    # 1 line of code!
    has_secure_password

    # The ! applies the change to itself
    before_save { email.downcase! }

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format:       { with: VALID_EMAIL_REGEX },
                                      uniqueness:   { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
end
