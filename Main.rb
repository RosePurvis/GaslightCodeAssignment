=begin
Writer: Rosalie Purvis
Date Started: 9/7/2019
Name: Main.rb

This will be the main program for my Coding assignment
The assignment is outlined in the README file, and can be referenced there. 
=end

=begin
create the class for an account, asking for parameters of username and password
create methods for user to write a post, follow other users, and see a newsfeed
will not be creating a clickable user interface, instead will simply do line prompts, 
next step would be to create more pleasing user interface.
=end

#Create the account Class
class Account
   #create the users hash as global so it can be accessed from anywhere in the program
   $users=Hash.new 
   #create the posts hash to hold all posts, later I can sort out the ones just for my followed users
   $posts=Hash.new
   #create a has just for followed users
   $followed_users=Hash.new
   
   #initialize with username and password
  def initialize(username,password)
    @username = username
    @password=password
     #dummy initialization for testing purposes
    $users["rpurvis"]="unicorns"
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
      #returns the users hash. Ideally this is in a better list format, next step to research better formatting
      return $users
   end
   
  #create method for following a user
   def follow_user(username)
      $followed_users = $users.select{username}
   end
   
  #create method for writing post
   def write_post(new)
      time=Time.now
      $posts[new]=time
      puts "You've made a new post at #{time}!"
      
   end
  
  #create method to view followed user's posts
   def display_followed_posts
      $followed_posts=$posts.select{$followed_users}
      return $followed_posts #ideally this is in chronological order, next step is to research how this would be handled
   end
end
#In here is where in the next step I would initate a loop to guarantee that the user has actually signed in before progressing
current = false
until current == true
   #first step is ask a person to sign up or log in!
   puts "Would you like to sign up or log in? "
   input =gets.chomp.downcase

   if input == "sign up"
      #create an account
      #ask for desired user name
      puts "Enter desired username: "
      #take the given input and assign it to username hash
      new_user=gets.chomp
      #get desired password
      puts "Enter desired password: "
      new_password = gets.chomp


      #add new user to users hash in account class, initialize the class
      current_account = Account.new(new_user,new_password)
      puts "Welcome, #{new_user}!"
      
   else

      #get user input for signing in
      puts "Enter Username: "
      entered_username =gets.chomp
      #get password
      puts "Enter password: "
      entered_password = gets.chomp
      #check for account
      current_account=Account.new(entered_username,entered_password)
      if $users.keys == entered_username #having problems getting the users hash pulled, next step to investigate correct use of calling
          if $users.values == entered_password
               puts "You're Logged in!"
          else
              current_account.password_error
          end

      else 
        current_account.username_error
      end
      current = true
   end
end

#make an arbitrary loop for the program to keep running, next step would be to have this loop more like an until statement 
#and use logging out as the way out of the loop. 
30.times {
#now that they are logged in, need to ask what action they would like to do!
puts "What would you like to do? write post, follow user, see newsfeed?"
action =gets.chomp.downcase
case action
  when "write post"
  	puts "What would you like to post?: "
    post = gets.chomp
    current_account.write_post(post)  #This worked! So, I am definitely having a problem with initializing with a "sign in" instead of a "sign up"
  when "follow user"
  	puts "Give username: "
   name =gets.chomp
   if $users[name].nil?
       puts "This user doesnt exist"
   else 
       current_account.follow_user(name)
       puts "You are now following #{name}!"
   end
  when "see newsfeed"
  	current_account.display_followed_posts
 
end
}
