class Post < ActiveRecord::Base
  has_many :comments #active record runtime da calisirken aldığı commenti arka planda kaydeder.bu onu tetikler
  validates :title, presence: true,
            length: { minimum: 5 }
end
