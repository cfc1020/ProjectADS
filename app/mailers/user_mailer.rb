class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def notification_for_new_comment_for_ad(ad, user)
    @ad = ad
    @userTo = user
    @url  = 'http://example.com/ads/ad.id'
    mail(to: @userTo.email, subject: 'Your ad commented')
  end
end
