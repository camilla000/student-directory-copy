def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the name
  name = gets.chomp.capitalize
  #while the name is not empty, repeat this code
  while !name.empty?
    puts "Which cohort is the student in?"
    cohort = gets.chomp
    if cohort == ""
      cohort = "Cohort not assigned"
    else
      cohort = cohort.to_sym
    end

    puts "What's the student's nationality? "
    nationality = gets.chomp.capitalize
    puts "How old is the student? "
    age = gets.chomp
    # add the student hash to the array
    students << { name: name, cohort: cohort, nationality: nationality, age: age }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the students array
  students
end

def num_char(students)
  students.select { |student| student[:name].length <= 12 }
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------------------------------"
end

def cohort_group(students)
  groups = {}
  students.each do |student|
    cohort = student[:cohort].to_sym
    if groups[cohort] == nil
      groups[cohort] = []
    end
    groups[cohort].push(student)
  end
  groups
end

def print(students)
  students.each do |cohort, cohort_students|
    puts "#{cohort.capitalize} Cohort".center(30)
    cohort_students.each_with_index do |identity, index|
      puts "#{index + 1}. #{identity[:name].capitalize}
      nationality: #{identity[:nationality]}
      age: #{identity[:age]}".center(30)
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
# initial = first_letter
# initial_students = print_students(students, initial)
length = num_char(students)
grouped_students = cohort_group(length)
print_header
# print(initial_students)
print(grouped_students)
print_footer(students)
