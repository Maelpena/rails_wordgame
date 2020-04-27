class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :games


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_best_score(score)
    if self.best_score == nil
      self.best_score = 0 
    end
    if self.best_score < score 
      self.best_score = score
    end
    self.save
  end
      
end
