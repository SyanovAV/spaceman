class Base
  include Requests::MessageLogger
  def can_process?
    false
  end

  def process message, test=false
    puts "Not realized process method!"
    puts "Can't process message:"
    puts message
  end
 end