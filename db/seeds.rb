# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def random_user
  User.all.sample
end

def random_company
  Company.all.sample
end

def random_event
  Event.all.sample
end

def random_salary
  rand(70000..130000)
end

def random_bool
  rand(2) == 1 ? true : false
end

10.times do |n|
  User.create(
    username: "fake_user_#{n}",
    email: Faker::Internet.email,
    password: 'password')

  Company.create(
    name: Faker::Company.name
    user_id: random_user)


  Job.create(
    job_title: Faker::Name.title
    lead_source: Faker::Name.name
    pro: Faker::Lorem.words(3)
    con: Faker::Lorem.words(3)
    short_summary: Faker::Lorem.sentence(3, true, 4)
    salary: Money.new(random_salary, "USD")
    company_id: random_company)

  Event.create(
    research: Faker::Lorem.sentence
    key_findings: Faker::Lorem.sentence
    takeaways: Faker::Lorem.sentence
    outcome: Faker::Lorem.sentence
    thankyou_note: random_bool
    follow_up: random_bool
    referral: random_bool
    feedback: random_bool
    business_card: random_bool)

  Contact.create(
    event_id: random_Event
    user_id: random_user
    first_name: Faker::Name.first_name
    last_name: Faker::Name.last_name
    title: Faker::name.title
    email: Faker::Internet.email
    phone: Faker::PhoneNumber.phone_number
    mobile: Faker::PhoneNumber.cell_phone
    do_not_call: random_bool
    background_info: Faker::Lorem.sentence)

  Address.create(
    street1: Faker::
    street2: Faker::
    city: Faker::
    state: Faker::
    zipcode: Faker::
    country: Faker::
    full_address: Faker::
    addressable_id: Faker::
    addressable_type: Faker::)


end
# Table name: jobs
#
#  id            :integer          not null, primary key
#  job_title     :string
#  lead_source   :string
#  pro           :string
#  con           :string
#  short_summary :text
#  salary        :integer
#  company_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null