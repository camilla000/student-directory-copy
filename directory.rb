def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the name
  name = gets.chomp.capitalize
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "What's the student's nationality? "
    nationality = gets.chomp.capitalize
    puts "How old is the student? "
     age = gets.chomp
    # add the student hash to the array
    students << { name: name, cohort: :november, nationality: nationality, age: age }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the students array
  students
end

def num_char(students)
  students.select {|student| student[:name].length <= 12}

end

# def first_letter
#   puts "What initial do you want to see?"
#   initial = gets.chomp
#   initial
# end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# def print_students(students, initial)
#   students.select {|student| student[:name].chars.first == initial.upcase}
# end

def print(students)
  # students.each_with_index do |student, index|
  #   puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  # end
  counting = 0
  while counting < students.count
    puts "#{counting +1}. #{students[counting][:name]} 
    nationality: #{students[counting][:nationality]} 
    age: #{students[counting][:age]}
    cohort: #{students[counting][:cohort]}"
    counting += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
# initial = first_letter
# initial_students = print_students(students, initial)
length = num_char(students)
print_header
# print(initial_students)
print(length)
print_footer(students)
