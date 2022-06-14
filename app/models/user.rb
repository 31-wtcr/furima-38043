class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,              presence: true
  validates :last_name,             presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :first_name,            presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :last_name_katakana,    presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :first_name_katakana,   presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :birthday,              presence: true

  validate :password_complexity

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-z])(?=.*?[0-9]).{6,70}$/

    errors.add :password, 'Complexity requirement not met. Length should be 6-70 characters and include: 1 alphabet, 1 digit'
  end

  has_many :items
end
