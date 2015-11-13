# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#  Student  degree mapping  {1: "ME", 2:"MS", 3:"PhD" }
#  Student  status mapping  {1: "Under Review", 2:"Assigned", 3:"Confirm"}
ApplicationPool.delete_all()
Course.delete_all()
User.delete_all()
StudentApplication.delete_all()
users = [{:name => 'user1', :uin => '922003095', :email => 'test1@gmail.com', :login => 'login1'},
          {:name => 'user2', :uin => '922773022', :email => 'test2@gmail.com', :login => 'login1'},
          {:name => 'user3', :uin => '922773023', :email => 'test3@gmail.com', :login => 'login1'},
          {:name => 'user4', :uin => '922773024', :email => 'test3@gmail.com', :login => 'login1'},
          {:name => 'user5', :uin => '111111111', :email => 'test3@gmail.com', :login => 'login1'}]

users.each do |user|
  User.create!(user)
end

studentapplications = [{:uin => '922003095', :first_name => 'Ha', :last_name => 'waka' , 
             :advisor => 'Miamia', :degree => '2', :start_semester => '2015 Fall', 
             :gpa => '4.0', :position => '1', :course_assigned => '0', :course_taken => 'CSCE-606-601', 
             :course_taed => 'CSCE-629-601', :preferred_area => 'Physics', :preferred_course => 'CSCE629', 
             :status => '1', :active_term => '20153', :application_pool_id => '1', :user_id => 1
            },
            {:uin => '922773022', :first_name => 'Testfirst', :last_name => 'Testlast' , 
             :advisor => 'T_Advisor', :degree => '3', :start_semester => '2012 Fall', 
             :gpa => '4.0', :position => '3', :course_assigned => '0', :course_taken => 'CSCE-633-601', 
             :course_taed => 'CSCE-603-601', :preferred_area => 'Machine Learning', :preferred_course => 'CSCE-603', 
             :status => '1', :active_term => '20153', :application_pool_id => '1', :user_id => 2
            },
            {:uin => '922773023', :first_name => 'Jack', :last_name => 'Sparrow' , 
             :advisor => 'T_Advisor', :degree => '3', :start_semester => '2013 Spring', 
             :gpa => '4.0', :position => '3', :course_assigned => '0', :course_taken => 'CSCE-633-601', 
             :course_taed => 'CSCE-603-601', :preferred_area => 'Compiler Design', :preferred_course => 'CSCE-603', 
             :status => '1', :active_term => '20153', :application_pool_id => '1', :user_id => 3
            }
        ]

studentapplications.each do |studentapplication|
  StudentApplication.create!(studentapplication)
end

application_pools = [{:year => '2015', :semester => 'Fall', :deadline => '2015-11-25 11:59:59', :active => true},
              {:year => '2015', :semester => 'Spring', :deadline => '2015-1-7 11:59:59', :active => false}]

application_pools.each do |application_pool|
  ApplicationPool.create!(application_pool)
end

courses = [
  {
    cid: "CSCE110",
    name: "PROGRAMMING I",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    :application_pool_id => '1',
    notes: "",
    user_id: 5
  },
  {
    cid: "CSCE111",
    name: "CPSC CONCEPTS &amp; PROGRAM",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    :application_pool_id => '1',
    notes: "",
    user_id: 5
  },
  {
    cid: "CSCE121",
    name: "INTRO PGM DESIGN CONCEPT",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    :application_pool_id => '1',
    notes: ""
  },
  {
    cid: "CSCE181",
    name: "INTRO TO COMPUTING",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE206",
    name: "STRUCTURED PROG IN C",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE221",
    name: "DATA STRUC &amp; ALGORITHM",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE222",
    name: "DISCRETE STRUC COMPUTING",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE312",
    name: "COMPUTER ORGANIZATION",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE313",
    name: "INTRO TO COMPUTER SYSTEM",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE314",
    name: "PROGRAMMING LANGUAGES",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE315",
    name: "PROGRAMMING STUDIO",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE410",
    name: "OPERATING SYSTEMS",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE411",
    name: "DESIGN ANALY ALGORITHMS",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE420",
    name: "ARTIFICIAL INTELLIGENCE",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE434",
    name: "COMPILER DESIGN",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE435",
    name: "PARALLEL COMPUTING",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE436",
    name: "COMP HUMAN INTERACTION",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE441",
    name: "COMPUTER GRAPHICS",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE444",
    name: "INTERACTIVE INFORMATION",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE462",
    name: "MICROCOMPUTER SYSTEMS",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE464",
    name: "WIRELESS AND MOBILE SYS",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE481",
    name: "SEMINAR",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE482",
    name: "SR CAPSTONE DESIGN",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE483",
    name: "COMPUTER SYS DESIGN",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE485",
    name: "DIRECTED STUDIES",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE489",
    name: "SPECIAL TOPICS IN",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE491",
    name: "RESEARCH",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE604",
    name: "PROG LANGUAGE DESIGN",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE606",
    name: "SOFTWARE ENGINEERING",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE608",
    name: "DATABASE SYSTEMS",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE611",
    name: "OPERATING SYSTEMS &amp; APPL",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE614",
    name: "COMPUTER ARCHITECTURE",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE617",
    name: "GENERIC PROGRAMMING",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE622",
    name: "SKETCH RECOGNITION",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE624",
    name: "ARTIFICIAL INTELLIGNCE",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE625",
    name: "ANALYSIS OF ALGORITHMS",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE629",
    name: "INTELL USER INTERFACE",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE634",
    name: "GEOMETRIC MODELING",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE645",
    name: "DIGITAL IMAGE",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE646",
    name: "PHYSIC BASED MODELING",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE649",
    name: "HPC EARTH SCIENCE &amp; PETE",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE657",
    name: "ADV NETWORK &amp; SECURITY",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE663",
    name: "TEST &amp; DIAG DIGITAL SYST",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE665",
    name: "SEMINAR",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE680",
    name: "PROFESSIONAL INTERNSHIP",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE681",
    name: "DIRECTED STUDIES",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE684",
    name: "SPECIAL TOPICS IN",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  },
  {
    cid: "CSCE685",
    name: "RESEARCH",
    lecturer: "ABC",
    insemail: "test@test.com",
    area: "Theory",
    description: "2015 Fall",
    ta: "N/A",
    credits: 3,
    notes: ""
  }
];

courses.each do |course|
  Course.create!(course)
end