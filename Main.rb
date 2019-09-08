=begin
Writer: Rosalie Purvis
Date Started: 9/7/2019
Name: Main.rb

This will be the main program for my Coding Challenge
The challenge is outlined in the README file, and can be referenced there. 
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
   #create a has just for followed users
   @@followed_users=Hash.new
   
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
  def username_error(username)
     #if @username == username
        
     #else
      return "Incorrect Username"
    # end
     
  end
  
  #create method for seeing all users
   def display_all_users
      #returns the users hash. Ideally this is in a better list format, next step to research better formatting
      return @@users
   end
   
  #create method for following a user
   def follow_user(username)
      @@followed_users = users.select(username)
   end
   
  #create method for writing post
   def write_post(new)
      time=Time.now
      @@posts[new]=time
      puts "You've made a new post at #{time}!"
      
   end
  
  #create method to view followed user's posts
   def display_followed_posts
      #most_recent = lambda{|x| x < Time.now}
      followed_posts=@@posts.select(@@followed_users)
      return followed_posts #ideally this is in chronological order, next step is to research how this would be handled
   end
end

#first step is ask a person to sign up or log in!
puts "Would you like to sign up or log in? "
input =gets.chomp.downcase

#create an account
#ask for desired user name
puts "Enter desired username: "
#take the given input and assign it to username hash
new_user=gets.chomp
#get desired password
puts "Enter desired password: "
new_password = gets.chomp


#add new user to users hash in account class
new_account = Account.new(new_user,new_password)
puts "Welcome, #{new_user}!"


#get user input for signing in
puts "Enter Username: "
entered_username =gets.chomp
#get password
puts "Enter password: "
entered_password = gets.chomp
#check for account
if users.key = entered_username #having problems getting the users hash pulled, next step to investigate correct use of calling
    if users.value == entered_password
         puts "You're Logged in!"
      else
         password_error
      end
   
else 
     username_error
end

#now that they are logged in, need to ask what action they would like to do!
puts "What would you like to do? write post, follow user, see newsfeed?"
action =gets.chomp.downcase
case action
  when "write post"
  	puts "What would you like to post?: "
    post = gets.chomp
   posts[post] #relook at how to add things to hashes
  
  
  when "follow user"
  	puts "Give username: "
  name =gets.chomp
  if users[name].nil?
    puts "This user doesnt exist"
  else 
    followed_users[name]
    puts "You are now following #{name}!"
  end
  
  when "see newsfeed"
  	followed_posts
 
  
end
