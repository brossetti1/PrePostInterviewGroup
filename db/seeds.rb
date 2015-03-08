# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


2.times do |n|
  User.create(
    username: "fake_user_#{n}",
    email: Faker::Internet.email,
    password: 'password')
end

User.all.to_a.each do |user|
  2.times do
    Company.create(
      name: Faker::Company.name,
      user_id: user.id)
  end
end


def random_salary
  rand(70000..13000)
end

Company.all.to_a.each do |company|
  3.times do
    Job.create(
      job_title: Faker::Name.title,
      lead_source: Faker::Name.name,

      
      short_summary: Faker::Lorem.sentence(3, true, 4),
      salary: Money.new(random_salary, "USD"),
      company_id: company.id,
      user_id: company.user_id,
      )
  end
end

def random_bool
  rand(2) == 1 ? true : false
end

def random_times(num)
  rand(num) + 1
end

Job.all.to_a.each do |job|
  Con.create(job_id: job.id,
             con: Faker::Lorem.words(3))

  Pro.create(job_id: job.id,
             pro: Faker::Lorem.words(3))

  random_times(3).times do
    Event.create(
      research: Faker::Lorem.sentence,
      key_findings: Faker::Lorem.sentence,
      takeaways: Faker::Lorem.sentence,
      outcome: Faker::Lorem.sentence,
      thankyou_note: random_bool,
      follow_up: random_bool,
      referral: random_bool,
      feedback: random_bool,
      business_card: random_bool,
      job_id: job.id,
      user_id: job.user_id
      )
  end
end

def random_event
  Event.all.sample
end

Event.all.to_a.each do |event|
  Contact.create(
    event_id: event.id,
    user_id: event.user_id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Name.title,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    mobile: Faker::PhoneNumber.cell_phone,
    do_not_call: random_bool,
    background_info: Faker::Lorem.sentence)
end

User.all.to_a.each do |user|
  Address.create(
    street1: Faker::Address.street_address,
    street2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zipcode: Faker::Address.zip.to_i,
    user_id: user.id,
    contact_id: nil,
    job_id: nil
  )
end

Contact.all.to_a.each do |contact|
  Address.create(
    street1: Faker::Address.street_address,
    street2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zipcode: Faker::Address.zip.to_i,
    user_id: nil,
    contact_id: contact.id,
    job_id: nil
  )
end

Job.all.to_a.each do |job|
  Address.create(
    street1: Faker::Address.street_address,
    street2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zipcode: Faker::Address.zip.to_i,
    user_id: nil,
    contact_id: nil,
    job_id: job.id
  )
end

Job.all.to_a.each do |job|
  Resume.create(
    user_id: job.user_id,
    job_id: job.id,
    url: Faker::Internet.url('mybucket.s3.amazonaws.com', '/fake_images.png')
  )
end
