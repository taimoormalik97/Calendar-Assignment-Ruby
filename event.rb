
class Event
  attr_reader :event_name, :description

  def initialize(event_name, description)
    @event_name, @description = event_name, description
  end

  def to_s
    puts "\n  Name: #{event_name}\n\n  Description: #{description}\n"
  end
end

  
