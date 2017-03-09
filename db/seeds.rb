User.destroy_all
Skill.destroy_all
UserSkill.destroy_all
Tribe.destroy_all
TribeMember.destroy_all
Equipment.destroy_all
Hut.destroy_all

User.create(
  email: "salim.benfarhat@yahoo.com",
  username: "sbenfarhat",
  password: "Azerty13",
  phone_number: "0611223344",
  average_rating: 4.56
)
User.create(
  email: "salim.lalam@gmail.com",
  username: "slalam",
  password: "Saclay",
  phone_number: "0644332211",
  average_rating: 5.00
)

specialities = ["Front-end", "Back-end", "Full-stack", "Web", "UI","Marketing", "Communication", "Freelance", "Web Development", "Creation of Web Sites", "Website Design", "Design Sense", "Customer Service Skills", "Web Server Administration", "Project Management"]
skills = ["Ruby", "Php", "Javascript", "Html", "Css", "Pack Adobe", "Microsoft Office", "Wordpress", "Python", "Mobile", "CEO","JavaScript and Ajax", "PHP", "ASP", "Java", "Perl", "C++", "Mobile Support"]

specialities.each { |x| Skill.create(name: x) }
skills.each { |x| Skill.create(name: x) }


us1 = UserSkill.create(user_id: 1, skill_id: 1)
us2 = UserSkill.create(user_id: 1, skill_id: 2)
us3 = UserSkill.create(user_id: 1, skill_id: 3)
us4 = UserSkill.create(user_id: 1, skill_id: 4)
us5 = UserSkill.create(user_id: 2, skill_id: 5)
us6 = UserSkill.create(user_id: 2, skill_id: 6)
us7 = UserSkill.create(user_id: 2, skill_id: 7)
us8 = UserSkill.create(user_id: 2, skill_id: 8)


tribe1 = Tribe.create(
  name: 'Ruby Paris',
  about: 'Our tribe is a place for willing and respectful independent workers passionate about ruby to come
  and work together. With many huts available, you will always find a nice place to work. Please be aware of
  the minimum requirements before joining the tribe.',
  short_desk: 'Tribe for Ruby lovers',
  requirement: '2 hours by week + Wifi and Kitchen'
)
tribe2 = Tribe.create(
  name: 'Java Marseille',
  about: 'Our tribe is a place for willing and respectful independent workers passionate about java to come
  and work together. With many huts available, you will always find a nice place to work. Please be aware of
  the minimum requirements before joining the tribe.',
  short_desk: 'Tribe for Java lovers',
  requirement: '4 hours by week + Wifi')
tribe3 = Tribe.create(
  name: 'PHP Toulouse',
  about: 'Our tribe is a place for willing and respectful independent workers passionate about php to come
  and work together. With many huts available, you will always find a nice place to work. Please be aware of
  the minimum requirements before joining the tribe.',
  short_desk: 'Tribe for PHP lovers',
  requirement: '3 hours by week + Wifi, Sofa and Kitchen')
tribe4 = Tribe.create(
  name: 'Python Marseille',
  about: 'Our tribe is a place for willing and respectful independent workers passionate about python to come
  and work together. With many huts available, you will always find a nice place to work. Please be aware of
  the minimum requirements before joining the tribe.',
  short_desk: 'Tribe for Python lovers',
  requirement: '5 hours by week + Wifi and Printer')
tribe5 = Tribe.create(
  name: 'C# Tunis',
  about: 'Our tribe is a place for willing and respectful independent workers passionate about C# to come
  and work together. With many huts available, you will always find a nice place to work. Please be aware of
  the minimum requirements before joining the tribe.',
  short_desk: 'Tribe for C# lovers',
  requirement: '8 hours by week + Wifi, Scanner, Printer, Garden, Sofa and Kitchen')
tribe6 = Tribe.create(
  name: 'Android London',
  about: 'Our tribe is a place for willing and respectful independent workers passionate about android to come
  and work together. With many huts available, you will always find a nice place to work. Please be aware of
  the minimum requirements before joining the tribe.',
  short_desk: 'Tribe for Android lovers',
  requirement: '2 hours by week + Wifi and Printer')
tribe7 = Tribe.create(
  name: 'iOS Amsterdam',
  about: 'Our tribe is a place for willing and respectful independent workers passionate about iOS to come
  and work together. With many huts available, you will always find a nice place to work. Please be aware of
  the minimum requirements before joining the tribe.',
  short_desk: 'Tribe for iOS lovers',
  requirement: '4 hours by week + Wifi and Scanner')
tribe8 = Tribe.create(
  name: 'Boston AI',
  about: 'Our tribe is a place for willing and respectful independent workers passionate about artificial intelligence
  to come and work together. With many huts available, you will always find a nice place to work. Please be aware of
  the minimum requirements before joining the tribe.',
  short_desk: 'Tribe for AI lovers',
  requirement: '3 hours by week + Coffe machine')


tm1 = TribeMember.create(tribe_id: 8, user_id: 2)
tm2 = TribeMember.create(tribe_id: 7, user_id: 2)
tm3 = TribeMember.create(tribe_id: 6, user_id: 2)
tm4 = TribeMember.create(tribe_id: 5, user_id: 2)
tm5 = TribeMember.create(tribe_id: 4, user_id: 1)
tm6 = TribeMember.create(tribe_id: 3, user_id: 1)
tm7 = TribeMember.create(tribe_id: 2, user_id: 1)
tm8 = TribeMember.create(tribe_id: 1, user_id: 1)

Hut.create(
  name: "La hutte de Paris",
  address: "9 avenue Montaigne",
  address2: "",
  zip_code: "75008",
  city: "Paris",
  country: "France",
  about: "Hut specialized in NFC technology",
  capacity: 7,
  user_id: 2,
  latitude: 48.865513,
  longitude: 2.30256
)
Hut.create(
  name: "La hutte de Marseille",
  address: "16 boulevard Bernabo",
  address2: "",
  zip_code: "13015",
  city: "Marseille",
  country: "France",
  about: "Hut specialized in Web technology",
  capacity: 4,
  user_id: 1,
  latitude: 43.337276,
  longitude: 5.355767
)

