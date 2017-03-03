# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Equipment.destroy_all
Tribe.destroy_all
Skill.destroy_all

tribe1 = Tribe.create(name: 'French Tribe', about: 'French Tribe by french people')
tribe2 = Tribe.create(name: 'English Tribe', about: 'English Tribe by english people')
tribe3 = Tribe.create(name: 'Spanish Tribe', about: 'Spanish Tribe by spanish people')
tribe4 = Tribe.create(name: 'Egyptian Tribe', about: 'Egyptian Tribe by egyptian people')

equipments = ["Wifi", "Printer", "Scanner", "Kitchen", "Coffe machine", "Sofa", "garden"]
# Large skills
specialities = ["Front-end", "Back-end", "Full-stack", "Web", "UI","Marketing", "Communication", "Freelance", "Web Development", "Creation of Web Sites", "Website Design", "Design Sense", "Customer Service Skills", "Web Server Administration", "Project Management"]
# Specifiques skills
skills = ["Ruby", "Php", "Javascript", "Html", "Css", "Pack Adobe", "Microsoft Office", "Wordpress", "Python", "Mobile", "CEO","JavaScript and Ajax", "PHP", "ASP", "Java", "Perl", "C++", "Mobile Support"]

equipments.each { |x| Equipment.create(name: x) }
specialities.each { |x| Skill.create(name: x) }
skills.each { |x| Skill.create(name: x) }
