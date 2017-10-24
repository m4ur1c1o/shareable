user = User.create!(first_name: 'Test', last_name: 'Yep', email: 'test@mail.com', password: '123456789')

puts '1 User created'

9.times do |project|
  Project.create!(title: "My project ##{project + 1}",
                  short_description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  image: 'http://via.placeholder.com/600x400',
                  user_id: user.id)
end

puts '9 Projects created'

5.times do |faq|
  Faq.create!(question: '¿Lorem ipsum dolor sit amet?',
              answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              project_id: Project.last.id)
end

puts '5 FAQs created'
