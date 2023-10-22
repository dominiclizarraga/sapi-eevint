# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Delete all existing records from the tables
QualityIssue.delete_all
ChangeLog.delete_all
Elevator.delete_all
Contract.delete_all

# Elevator Types
ELEVATOR_TYPES = {
  T1: 0,
  T2: 1,
  T3: 2,
  T4: 3,
  T5: 4
}.freeze

# Severities for QualityIssue
SEVERITIES = {
  low: 0,
  medium: 1,
  high: 2,
  critical: 3
}.freeze

# count
num = 1

# Create Contracts and Elevators
20.times do
  puts "Creating Contract..."
  contract = Contract.create(
    job_name: Faker::Company.name,
    job_number: Faker::Number.unique.number(digits: 5),
    actual_end_at: Faker::Date.between(from: 1.year.ago, to: Date.today),
    actual_start_at: Faker::Date.between(from: 2.years.ago, to: 1.year.ago),
    customer_name: Faker::Company.name,
    eng_required_date_at: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    selling_price: Faker::Number.decimal(l_digits: 5, r_digits: 2),
    work_status: Faker::Number.within(range: 0..6),
    entry_date: Faker::Date.between(from: 2.years.ago, to: 1.year.ago),
    weeks_estimate: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    weeks_engineering: Faker::Date.between(from: Date.today, to: 1.year.from_now)
  )

  # Work on change logs for work_status
  # num_changes = rand(2..3)
  # previous_status = contract.work_status

  # num_changes.times do
  #   new_status = Contract.work_statuses.keys.reject { |status| status == previous_status }.sample

    # Update the contract's work_status and save
    # contract.update(work_status: new_status)

    # Create a ChangeLog for the work_status change
    # ChangeLog.create(
    #   contract: contract,
    #   old_work_status: previous_status,
    #   new_work_status: new_status
    # )

    # Set the current status as the previous status for the next iteration
    # previous_status = new_status
  # end

  elevators = []

  rand(0..7).times do
    elevator = contract.elevators.create(
      elevator_type: ELEVATOR_TYPES.values.sample,
      description: Faker::Lorem.sentence,
      subdivision: Faker::Address.community
    )
    elevators << elevator.id
  end

  # Create Quality Issues for the Contract
  rand(0..2).times do
    quality_issue = contract.quality_issues.create(
      date: Faker::Date.between(from: 2.years.ago, to: Date.today),
      description: Faker::Lorem.paragraph(sentence_count: 2),
      severity: SEVERITIES.values.sample,
      status: QualityIssue.statuses.values.sample,
      resolved_at: [Faker::Date.between(from: 2.years.ago, to: Date.today)].sample # Randomly set some as resolved
    )
  end
  
  puts "#{num}. Contract ID: #{contract.id}, Elevator IDs: #{elevators.join(', ')}"
  num += 1
end

puts "Seed data created successfully! #{Contract.count} contracts, #{Elevator.count} elevators, #{ChangeLog.count} change logs, and #{QualityIssue.count} quality issues created."