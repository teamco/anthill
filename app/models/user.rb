class User < ActiveRecord::Base
  has_one :language
  belongs_to :item

  has_many :error_logs,
           :class_name => 'ErrorLog',
           :foreign_key => 'fixed_by'

  has_many :item_connections,
           :as => :connectable,
           :dependent => :destroy

  attr_accessor :password, :password_confirmation

  validates :login,
            :presence => true,
            :uniqueness => true

  validates :password,
            :presence => true,
            :length => 6..30,
            :on => :create,
            :confirmation => true

  before_create :downcase_username, :encrypt_password

  def downcase_username
    self.login.downcase!
  end

  def self.authenticate(login, password)
    user = find_by_login(login)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end