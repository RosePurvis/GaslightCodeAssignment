=begin
Writer: Rosalie Purvis
Date Started: 9/7/2019
Name: Main.rb
=end

=begin
This will be the main program for my Coding Challenge
The challenge is outlined in the README file, and can be referenced there. 
=end

=begin
After completing a Ruby beginner course, I am going to make twitter using classes, methods, etc. 
I will layout everything in comments, then begin adding in the code. 
=end

=begin
create the class for an account, asking for parameters of username and password
create a way for user to make a post-to be flushed out later
create way for user to follow another user-to be flushed out later
will not be creating a clickable user interface, instead will simply do line prompts
=end

#Create the account Class
class Account
   #create the users hash as global so it can be accessed from anywhere in the program
   @@users=Hash.new
   #create the posts hash to hold all posts, later I can sort out the ones just for my followed users
   @@posts=Hash.new
   #initialize with username and password
  def initialize(username,password)
    @username = username
    @password=password
  end
  
    
 #create the method for handling incorrect passwords  
  def password_error
    return "Incorrect Password"
  end
  #create the method for handling incorrect username
  def username_error
    return "Incorrect Username"
  end
  
  #create method for seeing all users
   def display_all_users
      #returns the users hash. Ideally this is in a better list format, but I will come back to this
      return @@users
   end
   
  #create method for following a user
   def follow_user(
   end
   
  #create method for writing post
   def write_post(new)
      time=Time.now
      @@posts[new]=time
      puts "You've made a new post at #{time}!"
      
   end
  
  #create method to view followed user's posts
   def display_followed_posts
   end
end
