# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

email_event_type = EventType.create(name: :email)
sms_event_type = EventType.create(name: :sms)

plan1 = Plan.create(name: :free, price: 0)
plan2 = Plan.create(name: :small, limit: 20, price: 5)
plan3 = Plan.create(name: :medium, limit: 100, price: 10)
plan4 = Plan.create(name: :large, limit: 500, price: 20)

plan1.event_types = [email_event_type]
plan2.event_types = [email_event_type, sms_event_type]
plan3.event_types = [email_event_type, sms_event_type]
plan4.event_types = [email_event_type, sms_event_type]