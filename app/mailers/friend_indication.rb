# encoding: utf-8
class FriendIndication < ActionMailer::Base
  default from: "from@example.com"


  def send3friends(user_indicator,user_to_receive,user_indication_ids)
    @receiver_name  = user_to_receive.name
    @indications    = User.find(user_indication_ids)
    @indicator_name = user_indicator.name

    mail to: user_to_receive.email, :subject => 'Indicação de amigos'
  end
end
