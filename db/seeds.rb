# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Delete all existing records from the tables
Elevator.delete_all
Contract.delete_all

# Create Contracts
contract1 = Contract.create(
  job_name: "Project A",
  job_number: "123",
  actual_end_at: Date.new(2023, 6, 30),
  actual_start_at: Date.new(2023, 5, 1),
  customer_name: "ABC Corp",
  eng_required_date_at: Date.new(2023, 4, 15),
  selling_price: 50000.0,
  work_status: 1,
  entry_date: Date.new(2023, 4, 1),
  weeks_estimate: rand(1..10).days.from_now.to_date,
  weeks_engineering: rand(1..10).days.from_now.to_date
)

# Create Elevators associated with Contract
elevator1 = Elevator.create(
  elevator_type: 1,
  description: "Passenger Elevator",
  subdivision: "Tower A",
  contract: contract1
)

elevator2 = Elevator.create(
  elevator_type: 2,
  description: "Freight Elevator",
  subdivision: "Warehouse",
  contract: contract1
)

puts "Seed data created successfully! #{Contract.count} contracts and #{Elevator.count} elevators created."
