#Hello

require_relative 'calendar'
calendar=Calendar.new
loop do
	system("clear")
	puts "\n\t\t\t***** Welcome To My Calendar *****\n\n"
	puts "\t\t\t1. Add Event"
	puts "\t\t\t2. Remove Event"
	puts "\t\t\t3. Edit Event"
	puts "\t\t\t4. Month View"
	puts "\t\t\t5. Events on a Specific Date"
	puts "\t\t\t6. Events of a Specific Month"
	puts "\t\t\t7. Exit"
	print "\t\t\tEnter: "
	input = gets.chomp.to_i
	system("clear")
	case input
		when 1
			puts "\n\t\t\t***** Add Event *****\n\n"
		begin
			print "\n  Enter name of the event: "
			event_name = gets.chomp
			raise if event_name == ""
			rescue Exception 
			puts "\n  Name cannot be Empty!"
			retry
		end
			print "\n  Enter description of the event: " 
			event_description = gets.chomp
		begin
			print "\n  Enter date in this format YYYY-MM-DD: "
			event_date = gets.chomp
			raise unless event_date =~ /\d\d\d\d(-)\d\d(-)\d\d/
			raise unless Date.iso8601(event_date)
			rescue Exception 
			puts "\n  Error in format of date!"
			retry
		end
      year, month, day = event_date.split('-')
      event_date = Date.new(year.to_i,month.to_i,day.to_i)
			if calendar.add_an_event(event_name, event_description, event_date) 
        puts "\n  Event Added!"
      end

		when 2
			puts "\n\t\t\t***** Delete Event *****\n\n"
		begin
			print "\n  Enter name of the event: "
			event_name = gets.chomp
			raise if event_name == ""
			rescue Exception 
			puts "\n  Name cannot be Empty!"
			retry
		end
		begin
			print "\n  Enter date in this format YYYY-MM-DD: "
			event_date = gets.chomp
			raise unless event_date =~ /\d\d\d\d(-)\d\d(-)\d\d/
			raise unless Date.iso8601(event_date)
			rescue Exception 
			puts "\n  Error in format of date!"
			retry
		end
      year, month, day = event_date.split('-')
      event_date = Date.new(year.to_i,month.to_i,day.to_i)
			if calendar.delete_an_event(event_name, event_date)
       puts "\n  Event Deleted!"
      else puts "\n  Event not found!"
      end

		when 3
			puts "\n\t\t\t***** Edit Event *****\n\n"
		begin
			print "\n  Enter name of the event: "
			event_name = gets.chomp
			raise if event_name == ""
			rescue Exception 
			puts "\n  Name cannot be Empty!"
			retry
		end
		begin
			print "\n  Enter date in this format YYYY-MM-DD: "
			event_date = gets.chomp
			raise unless event_date =~ /\d\d\d\d(-)\d\d(-)\d\d/
			raise unless Date.iso8601(event_date)
			rescue Exception 
			puts "\n  Error in format of date!"
			retry
		end
			print "\n  Now Enter new details of the event: "
		begin
			print "\n  Enter name of the event: "
			new_event_name = gets.chomp
			raise if event_name == ""
			rescue Exception 
			puts "\n  Name cannot be Empty!"
			retry
		end
			print "\n  Enter description of the event: " 
			new_event_description = gets.chomp
		begin
			print "\n  Enter date in this format YYYY-MM-DD: "
			new_event_date = gets.chomp
			raise unless event_date =~ /\d\d\d\d(-)\d\d(-)\d\d/
			raise unless Date.iso8601(event_date)
			rescue Exception 
			puts "\n  Error in format of date!"
			retry
		end
      year, month, day = event_date.split('-')
      event_date = Date.new(year.to_i,month.to_i,day.to_i)
      year, month, day = new_event_date.split('-')
      new_event_date = Date.new(year.to_i,month.to_i,day.to_i)
			if calendar.update_an_event(event_name, event_date, new_event_name, new_event_date, new_event_description)
       puts "\n  Event Updated!"
      else puts "\n  Event not found!"
      end

		when 4
			puts "\n\t\t\t***** Monthly View *****\n\n"
		begin
			print "\n  Enter year and month in this format YYYY-MM: "
			event_date = gets.chomp
			raise unless event_date =~ /\d\d\d\d(-)\d\d/
			raise unless Date.iso8601(event_date)
			rescue Exception 
			puts "\n  Error in format of date!"
			retry
			end

			calendar.month_view(event_date)
		when 5
			puts "\n\t\t\t***** Events on a Specific Date*****\n\n"
		begin
			print "\n  Enter date in this format YYYY-MM-DD: "
			event_date = gets.chomp
			raise unless event_date =~ /\d\d\d\d(-)\d\d(-)\d\d/
			raise unless Date.iso8601(event_date)

			rescue Exception 
			puts "\n  Error in format of date!"
			retry
		end
      year, month, day = event_date.split('-')
      event_date = Date.new(year.to_i,month.to_i,day.to_i)
			unless calendar.see_event_on_specific_date(event_date)
        puts "\n  Event not found!"
      end
		when 6
			puts "\n\t\t\t***** Events of a Specific Month*****\n\n"
		begin
			print "\n  Enter year and month in this format YYYY-MM: "
			event_date = gets.chomp
			raise unless event_date =~ /\d\d\d\d(-)\d\d/
			raise unless Date.iso8601(event_date)

			rescue Exception
			puts "\n  Error in format of date!"
			retry
		end
			calendar.see_event_on_specific_month(event_date)
		when 7
			exit(0)
	end
			print "\nPress Enter to continue!"
			gets
end