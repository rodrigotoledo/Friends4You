class User < ActiveRecord::Base
  attr_accessible :email, :latitude, :longitude, :name, :visiting_now, :distance
  validates_presence_of :name, :email, :latitude, :longitude 
  
  def to_param
    [self.id,self.name.parameterize].join('-')
  end
  
  def send_indications(user_to_receive_id,user_indication_ids)
    user_to_receive = User.find(user_to_receive_id)
    FriendIndication.send3friends(self,user_to_receive,user_indication_ids).deliver
  end
  
  def all_friends
    self.close_friends(:max)
  end
  
  def close_friends(number_friends = 3,except_user_id = nil)
    except_user_ids = []
    except_user_ids << self.id
    except_user_ids << except_user_id if except_user_id
    friends = User.where("id NOT IN(?)",except_user_ids).
    order(:distance).
    select("users.*, SQRT(
        POW(69.1 * (latitude - #{self.latitude}), 2) +
        POW(69.1 * (#{self.longitude} - longitude) * COS(latitude / 57.3), 2)) AS distance")
    
    friends = friends.limit(number_friends) if number_friends.is_a?(Integer)
    
    friends.all
    
  end
  
  def self.visit_friend(user_friend_id)
    friend = User.find(user_friend_id)
    friend.update_attribute(:visiting_now, true)
  end
  
  def visiting_anyone?
    !in_house_of.nil?
  end
  
  def in_house_of
    User.where(:visiting_now => true).first
  end
  
  def self.clear_visit
    User.update_all(:visiting_now => false)
  end
end
