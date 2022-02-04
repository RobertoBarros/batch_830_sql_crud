class Router
  def initialize(doctors_controller)
    @doctors_controller = doctors_controller
  end

  def run
    loop do
      puts "Welcome to the Doctors App!"
      puts "1 - List all doctors"
      puts "2 - Create a doctor"
      puts "3 - Update a doctor"
      puts "4 - Delete a doctor"
      puts "5 - Exit"
      puts "What would you like to do?"

      choice = gets.chomp.to_i

      case choice
      when 1
        @doctors_controller.list
      when 2
        @doctors_controller.create
      when 3
        @doctors_controller.update
      when 4
        @doctors_controller.destroy
      when 5
        break
      end
    end
  end
end
