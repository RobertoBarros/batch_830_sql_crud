class DoctorsView
  def ask_name(current = nil)
    puts "What is the doctor's name? #{'(current: ' + current + ')' if current}".blue
    gets.chomp
  end

  def ask_age(current = nil)
    puts "What is the doctor's age? #{'(current: ' + current.to_s + ')' if current}".blue
    gets.chomp.to_i
  end

  def ask_specialty(current = nil)
    puts "What is the doctor's specialty? #{'(current: ' + current + ')' if current}".blue
    gets.chomp
  end

  def ask_id(to)
    puts "Enter the ID of the doctor to #{to}:"
    gets.chomp.to_i
  end

  def info_created(doctor)
    puts "The doctor ID #{doctor.id} has been created.".green
  end

  def info_updated(doctor)
    puts "The doctor ID #{doctor.id} has been updated.".yellow
  end

  def info_removed(doctor)
    puts "The doctor ID #{doctor.id} has been removed.".red
  end


  def list(doctors)
    system "clear"
    puts '-' * 80
    puts "DOCTORS LIST"
    puts '-' * 80
    doctors.each do |doctor|
      puts "ID: #{doctor.id} - #{doctor.name} - Age: #{doctor.age} - Specialty: #{doctor.specialty}".green
    end
    puts '-' * 80
  end
end
