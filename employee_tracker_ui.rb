require 'active_record'
require './lib/employee'
require './lib/division'

database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  system "clear"
  puts "\n" + "*"*40, "BINFORD 5100 EMPLOYEE TRACKER", "*"*40
  puts "\n\nPress Enter to Continue\n\n"
  gets
  system "clear"
  menu
end

def menu
  puts "*"*40, "MAIN MENU", "*"*40
  choice = nil
  until choice == 'x'
    puts  "\n\n\tE: Employees",
          "\tD: Divisions",
          "\tP: Projects",
          "\tX: Exit Program\n\n"
          choice = gets.chomp
          case choice
          when 'e'
            employees
          when 'd'
            divisions
          when 'p'
            projects
          when 'x'
            puts "\nGoodbye"
          else
            system "clear"
            puts "\nThat was an invalid entry. Please try again.\n"

          end
  end
end

def employees
  puts "\nEnter your selection: "
  choice = nil
  puts  "\n\n\tL: List All Employees",
        "\tA: Add a New Employee",
        "\tP: Add an Existing Employee to a Project",
        "\tM: Return to Main Menu"
        "\tX: Exit Program\n\n"

        choice = gets.chomp
        case choice
        when 'l'
          all_employees
        when 'a'
          add_new_employee
        when 'p'
          add_ee_to_project
        when 'm'
          menu
        when 'x'
          puts "Goodbye"
        else
          puts "\nInvalid entry. Please try again.\n"
        end
end


def all_employees
  puts "\n\nAll Employees in Database:", "-"*40
  Employee.all.each { |employee| puts "\t" + employee.name }

end


def new_employee

end

def divisions

  puts "\n\nCOMPANY DIVISIONS", "-"*40
  puts "\n\nEnter your selection: "
  choice = nil
  puts  "\n\n\tL: List All Divisions",
        "\tA: Add a New Division",
        "\tE: Add an Existing Employee to a Division",
        "\tM: Return to Main Menu"
        "\tX: Exit Program\n\n"

        choice = gets.chomp
        case choice
        when 'l'
          all_divisions
        when 'a'
          add_new_division
        when 'e'
          add_ee_to_division
        when 'm'
          menu
        when 'x'
          puts "Goodbye"
        else
          puts "\nInvalid entry. Please try again.\n"
        end

end

def all_divisions
  puts "\n\nCompany Divisions:", "-"*40
  Division.all.each_with_index do |index, division|
    puts "\t#{index + 1}." + division.name
  end
end

def add_new_division
  puts "\nNew Division Name: "
  division_name = gets.chomp
  division = Division.new(:name => division_name)
  division.save
  puts "'#{division_name}' has been added as a new division."
end

def add_ee_to_division
  # puts "\nPlease search for the division you wish to add an employee to: "
  # searched_division = gets.chomp
  # division = Division.where(searched_division = %division)

end


welcome








