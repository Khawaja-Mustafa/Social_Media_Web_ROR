class SocialUpdateMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Account.find_each do |account|
      SocialUpdateMailer.with(account: account, fact: CatfactServices::Catfact.new.daily_fact).daily_catfact.deliver_now
    end
  end
end
