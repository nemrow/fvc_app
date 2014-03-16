require 'csv'

class BuildRoster

  def initialize
    @roster_files = csv_files
  end

  def run
    @roster_files.each do |file|
      week_num = extract_week_num_from_file(file)
      build_roster_for_single_week(file, week_num)
    end
  end

  def csv_files
    Dir.glob('csv_files/rosters/*.csv')
  end

  def build_roster_for_single_week(file, week_num)
    week = Week.create(:week_num => week_num)
    CSV.foreach(file) do |family_data|
      family = create_family(family_data)
      family.weeks << week
    end
  end

  def create_family(family_data)
    Family.create(
      :last_name => family_data[0], 
      :login_code => Family.create_new_login_code,
      :room_num => family_data[2]
    )
  end

  def extract_week_num_from_file(file)
    begin
      file.match(/family_roster_week_(\d+)/)[1]
    rescue
      puts "File '#{file}' does not follow naming conventions"
      puts "Needs to be like this: 'family_roster_week_1'"
    end
  end
end

BuildRoster.new().run