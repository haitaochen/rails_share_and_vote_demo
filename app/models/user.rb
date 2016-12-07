class User < ActiveRecord::Base
  acts_as_votable
  acts_as_voter
end
