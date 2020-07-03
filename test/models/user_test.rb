# happens in sanbox
require 'test_helper'

class UserTest < ActiveSupport::TestCase
    # first you set it up
    def setup 
        @user = User.new(name:"jeff", email: "jeff@gmail.com",password: "iresponsible Gods" )
    end


    # then start defining tests abd their assersiios(answers)

# name shoulld not be null
test "user name shhould be valid" do
    @user.name=""
    assert_not @user.valid?
end
# the usser object should be valid
test "user  should be valid" do
    assert @user.valid? , "#{@user.inspect}"
end
# testin the uniquess
test "email adress should be unique" do
 dup_user = @user.dup #firstly, u duplicate the an existin user... in n this cas the one being set up
 dup_user.email = @user.email.upcase 
 @user.save
 assert_not dup_user.valid? #the system should asert not ie: the object will pass the test ..kama this assertion returns false
end
# here we make sure the system only acepts  the valid  email adresses
test "validate adresses should be acccepted" do
    valid_addresses = [ 'nyasingajeff@gmail.com' ,'R_TDD-DS@farehigh.hello.org', 'jeff@gku.au', 'ohyesd@gmail.cm'] #separates out to diff elements of an array
    valid_addresses.each do |va|
        @user.email = va
        assert  @user.valid?, "#{va.inspect} shouild be valid"
    end
end

test" invalid adresses should be rejected" do
    inavalid_adresses = %w[jeff@nyasinga,com ruby.rails@joi, eee@i_bfv_.com fooo@bar+=ef.com ]
    inavalid_adresses.each do |ia| 
        @user.email = ia
        assert_not @user.valid?"#{ia.inspect} is invalid"
    end 
end

end