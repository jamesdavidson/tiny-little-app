# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[Discussion,Update,Topic,Location,Beverage].each(&:delete_all)

d = Discussion.create(shortlink: 'a123x4')
Update.create(discussion: d)
Update.create(discussion: d)
Update.create(discussion: d)

# Update.create(discussion: d, updatable: Topic.create(name: 'Programming'))
# Update.create(discussion: d, updatable: Location.create(name: 'Melbourne'))
# Update.create(discussion: d, updatable: Beverage.create(name: 'Coffee'))
