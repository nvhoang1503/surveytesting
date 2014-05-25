class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :surveys

  ROLE ={
    :admin => 1,
    :user => 2
  }

  def is_admin
    if self.role == ROLE[:admin]
      true
    else
      false
    end    
  end

  def is_user
    if self.role == ROLE[:user]
      true
    else
      false
    end    
  end

end
