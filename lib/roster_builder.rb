require 'csv'
require 'debugger'

class BuildRoster
  FIRST_MIN_DATE = DateTime.new(2014, 3, 22, 12, 0) # DateTime.new(2014, 6, 21, 12, 0)
  FIRST_MAX_DATE = DateTime.new(2014, 3, 29, 12, 0) # DateTime.new(2014, 6, 28, 12, 0)

  def initialize
    @roster_files = csv_files
  end

  def run_families_and_weeks
    @roster_files.each do |file|
      week_num = extract_week_num_from_file(file)
      build_roster_for_single_week(file, week_num)
    end
  end

  def run_staff
    20.times do 
      Staff.create(
        :name => Faker::Name.name,
        :login_code => User.create_new_login_code
      )
    end
  end

  private
    def csv_files
      Dir.glob('csv_files/rosters/*.csv')
    end

    def build_roster_for_single_week(file, week_num)
      week = create_week(week_num)
      CSV.foreach(file) do |family_data|
        family = create_family(family_data)
        family.weeks << week
      end
    end

    def create_week(week_num)
      week_index = (week_num - 1)
      min_date = FIRST_MIN_DATE + (7 * week_index).days
      max_date = FIRST_MAX_DATE + (7 * week_index).days
      Week.create(
        :week_num => week_num,
        :min_date => min_date,
        :max_date => max_date
      )
    end

    def create_family(family_data)
      Family.create(
        :last_name => family_data[0], 
        :login_code => User.create_new_login_code,
        :room_num => family_data[2]
      )
    end

    def extract_week_num_from_file(file)
      begin
        file.match(/family_roster_week_(\d+)/)[1].to_i
      rescue
        puts "File '#{file}' does not follow naming conventions"
        puts "Needs to be like this: 'family_roster_week_1'"
      end
    end
end

BuildRoster.new().run_families_and_weeks
BuildRoster.new().run_staff