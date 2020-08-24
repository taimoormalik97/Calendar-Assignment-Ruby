require 'time'
require 'date'
require_relative 'event'

class Calendar
	attr_accessor :all_events
	def initialize
		@all_events={}
		#@all_events = Hash.new([])
	end
	def add_an_event(event_name, event_description, event_date)
		return if event_name.nil? || event_name.empty? || event_date.nil?

		event = Event.new(event_name, event_description)
		@all_events[event_date] = [] unless @all_events.has_key?(event_date)
		@all_events[event_date] << event
	end

	def delete_an_event(event_name, event_date)
		return if event_name.nil? || event_name.empty? || event_date.nil?
		
		specific_event = nil
		if @all_events.has_key?(event_date)
			@all_events[event_date].each do |event|
				specific_event = event if event.event_name == event_name
				break
			end
			if specific_event
				@all_events[event_date].delete(specific_event) 
				@all_events.delete(event_date) if @all_events[event_date].size == 0
			else return false
			end
		else
			return false
		end
	end

  def update_an_event(event_name, event_date, new_event_name, new_event_date, new_event_description)

    if delete_an_event(event_name, event_date)
         add_an_event(new_event_name, new_event_description, new_event_date)
         return true
    else return false
    end
  end

	def see_events

		@all_events.each do|key,events|
			puts "Date: #{key}"
			events.each_with_index do|event,index|
			puts "Event # #{index+1}:"
			puts "#{event.to_s}"
			end
		end
	end
	def see_event_on_specific_date(event_date)
		
		if @all_events.has_key?(event_date)
			puts "\n  Date: #{date}\n********************************************************************************"
			@all_events[event_date].each_with_index do |event,index|
				puts "  Event # #{index+1}:"
				event.to_s
				puts "********************************************************************************"
			end
      return true
		end
    return false
	end
	def see_event_on_specific_month(event_date)

		year , month = event_date.split('-')
		(1..31).each do |x| 
			date = Date.new(year.to_i,month.to_i,x)
        	if @all_events.has_key?(date)
        		puts "\n  Date: #{date}\n********************************************************************************"
        		@all_events[date].each_with_index do |event,index|
				puts "  Event # #{index+1}:"
				event.to_s
				puts "********************************************************************************"
				end
			end
     	end
	end
	def month_view(event_date)

		year , month = event_date.split('-')
		date=Date.civil(year.to_i,month.to_i,-1)
		x=date.strftime("%d")
		puts "\nSUN    \tMON    \tTUE    \tWED    \tTHU    \tFRI    \tSAT"
		(1..x.to_i).each do |x|
			date = Date.new(year.to_i,month.to_i,x)
			if(date.strftime("%A") == "Sunday") 
				print date.strftime("%d")
			elsif(date.strftime("%A") == "Monday") 
				print "\t" if x == 1
				print date.strftime("%d")
			elsif(date.strftime("%A") == "Tuesday") 
				print "\t\t" if x == 1
				print date.strftime("%d")
			elsif(date.strftime("%A") == "Wednesday") 
				print "\t\t\t" if x == 1
				print date.strftime("%d")
			elsif(date.strftime("%A") == "Thursday") 
				print "\t\t\t\t" if x == 1
				print date.strftime("%d")
			elsif(date.strftime("%A") == "Friday") 
				print "\t\t\t\t\t" if x == 1
				print date.strftime("%d")
			elsif(date.strftime("%A") == "Saturday") 
				print "\t\t\t\t\t\t" if x == 1
				print date.strftime("%d")
				if @all_events.has_key?(date)
        			print "=>", @all_events[date].size
     			else print "=>",0
     			end
				puts "\n\n"
				next
			end
			if @all_events.has_key?(date)
        		print "=>", @all_events[date].size
     		
     		else print "=>", 0
     		end
     			print "   "
	    end
    end	
end
