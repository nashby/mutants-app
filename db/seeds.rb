# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mutants = Mutant.create!([
  {name: 'Angel'},
  {name: 'Ariel'},
  {name: 'Armor'},
  {name: 'Aurora'},
  {name: 'Beast'},
  {name: 'Blink'},
  {name: 'Box'}
])

tasks = Task.create!([
  {name: 'Task 1'},
  {name: 'Task 2'},
  {name: 'Task 3'},
  {name: 'Task 4'},
  {name: 'Task 5'}
])

teams = Team.create!([
  {name: 'Team 1', mutants: [mutants[0], mutants[1]]},
  {name: 'Team 2', mutants: [mutants[2], mutants[3]]},
  {name: 'Team 3', mutants: [mutants[4], mutants[5]]},
  {name: 'Team 4', mutants: [mutants[0], mutants[3]]},
  {name: 'Team 5', mutants: [mutants[4], mutants[2]]}
])

