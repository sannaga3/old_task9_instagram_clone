class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "paguken6@yahoo.co.jp", subject: "投稿完了メール"
  end
end
