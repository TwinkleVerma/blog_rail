class Comment < ApplicationRecord  
  belongs_to :article
  belongs_to :user
  has_many :likes, as: :like, dependent: :destroy

  after_save :send_mail

  private

  def send_mail
    UserMailer.comment_notification_email(self).deliver_later
  end

end
