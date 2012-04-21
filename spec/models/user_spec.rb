require 'spec_helper'

describe User do
  it "should not have been visit anybody" do
    user = FactoryGirl.create(:user)
    user.visiting_anyone?.should be_false
  end
  
  it "should have been visit a friend" do
    FactoryGirl.create(:user, :visiting_now => true)
    user = FactoryGirl.create(:user)
    user.visiting_anyone?.should be_true
  end
  
  it "should visit a friend" do
    current_user = FactoryGirl.create(:user)
    1.upto(9) do
      FactoryGirl.create(:user)
    end
    
    User.where(:visiting_now => false).count.should eql(10)
    
    friend = FactoryGirl.create(:user)
    User.visit_friend(friend.id).should be_true
    current_user.in_house_of.id.should eql(friend.id)
  end
  
  it "should clear visit" do
    FactoryGirl.create(:user, :visiting_now => true)
    User.where(:visiting_now => true).count.should eql(1)
    User.clear_visit.should be_true
    User.where(:visiting_now => true).count.should eql(0)
  end
  
  it "should get 3 close friends" do
    user = FactoryGirl.create(:user)
    1.upto(9) do
      FactoryGirl.create(:user)
    end
    user.close_friends.count.should eql(3)
  end
  
  
  it "should get 9 close friends except current and a friend" do
    user        = FactoryGirl.create(:user)
    except_user = FactoryGirl.create(:user)
    1.upto(9) do
      FactoryGirl.create(:user)
    end
    close_friends = user.close_friends(20,except_user.id)
    close_friends.should_not include(except_user)
  end
  
  
  it "should get all friends except current" do
    
    user        = FactoryGirl.create(:user)
    1.upto(20) do
      FactoryGirl.create(:user)
    end
    friends = user.all_friends
    friends.should_not include(user)
  end
end