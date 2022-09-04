class SocialUpdatesMailer < ApplicationMailer
  def daily_socialupdate
    @account = params[:account]
    @fact = params[:fact]
    mail(to: @account.email, subject: "Daily socialupdate! ##{Fact.count}")
  end
end
