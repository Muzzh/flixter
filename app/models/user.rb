class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course

  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => Devise::email_regexp
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :username, uniqueness: { :case_sensitive => false }
  validates :password, length: { minimum: 8, maximum: 20 }, unless: "password.nil?"
  validates :password, presence: true, if: "id.nil?"

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
end
