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
   
  #create method for writing post
  
  
end
