# create a new Class, User, that has the following attributes:
# - name
# - email
# - password

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content

# add a method to user so, user can enter to a room
# user.enter_room(room)

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)

class User
    attr_accessor :name, :email, :password, :rooms
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
      @rooms = [] 
    end
  
    def enter_room(room)
      @rooms << room
      room.add_user(self)
    end
  
    # Method for user to send a message to a room
    def send_message(room, content)
      if @rooms.include?(room)
        message = Message.new(self, room, content)
        room.broadcast(message)
      else
        puts "You are not in the room."
      end
    end
  
    # Method for user to acknowledge a message in a room
    def acknowledge_message(room, message)
      if room.users.include?(self)
        puts "#{@name} acknowledged the message: #{message.content}"
      else
        puts "You are not in the room."
      end
    end
  end


class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    # Add user to the room
    def add_user(user)
      @users << user unless @users.include?(user)
      puts "#{user.name} has entered the room #{@name}."
    end
  
    # Broadcast a message to all users in the room
    def broadcast(message)
      @users.each do |user|
        puts "#{message.user.name} says in #{@name}: #{message.content}"
        user.acknowledge_message(self, message)
      end
    end
  end



class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
  # Example usage:
  
  # Create users
  user1 = User.new("Jay", "Inwza@gmail.com", "1234")
  user2 = User.new("Ton", "Ton@gmail.com", "5678")
  
  # Create a room
  room = Room.new("Game room", "A room for playing games")
  
  # Users enter the room
  user1.enter_room(room)
  user2.enter_room(room)
  
  # Users send messages
  alice.send_message(room, "Hello")
  user2.send_message(room, "Hi")