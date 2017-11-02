require_relative 'shamebot/connection'
require 'yaml'

module WallOfShame
    
  class << self

    def teams
      data.keys
    end
    
    def users 
      data.map { |_, v| v.keys }.flatten
      
      # move to access class
      # users = data.map { |_, v| v.keys }
      # teams = data.keys
      # teams.zip(users)
      #   .map(&:flatten)
      #   .map { |t| t.join(', ') }
      #   .map { |t| t.sub(/,/, ':') }
      #   .join("\n")
    end
    
    def add_team(team_name)
      team = team_name.upcase
      return false if data[team].tap do |t| 
        errors << "#{team} already listed as team" if t
      end
      !!(data[team] = {})
    end
    
    def add_user(user_name, team_name)
      team = team_name.upcase
      user = user_name.capitalize
      return false unless team_data(team) 
      return false if user_in_other_team?(user, team)
      return false if data[team][user].tap do |u|
        errors << "#{user} already listed under #{team}" if user
      end
      !!(data[team][user] = [])
    end
    
    def user_in_other_team?(user, team)
      remaining_teams = teams - [team]
      other_user_teams = remaining_teams.select { |t| data[t].include?(user) }
      other_user_teams.any?.tap do |in_other_team|
        errors << "#{user} already listed under another team" if in_other_team
      end
    end
    
    def user_data(user_name)
      user_data = teams.map { |team| data[team][user_name.capitalize] }.flatten.compact
      return false if user_data.empty?.tap do |user|
        errors << "#{user_name} not listed as user" if user_data.empty?
      end
      user_data
    end
    
    def team_data(team_name)
      team_data = data[team_name.upcase]
      return false unless team_data.tap do |team|
        errors << "#{team_name} not listed as team" unless team
      end
      team_data
    end
    
    # def list_shamings(name)
    #   case
    #   when teams.include?(name.upcase)
    #     team_data(name)
    #   when users.include?(name.capitalize)
    #     user_data(name)
    #   end
    # end
    
    # add these to lookup class
    # def team_shamings(team_name)
    #   data[team_name.upcase].values.flatten
    # end
    # 
    # def count_team_shamings(team_name)
    #   team_name = team_name.upcase
    #   data[team_name]
    # end
    
    def user_team(user_name)
      user = user_name.capitalize
      user_data(user) ? data.map { |k,v| k if v[user] }.compact.first : false
    end
    
    def shame(user_name, *reasons)
      user = user_name.capitalize
      user_data(user) ? !!(reasons.each { |reason| data[user_team(user)][user] << reason }) : false
    end
    
    def errors
      @errors ||= []
    end
    
    private
    
    def data
      @@data ||= read_yaml #|| generate_yaml
    end
    
    def read_yaml
      puts 'reading from yaml...'
      @@data = YAML.load_file("wall_of_shame.yaml")
    end
    
    def generate_yaml
      drive_worksheet.each do |row|
        @@data[row[0]] = {} unless @@data[row[0]]
        @@data[row[0]][row[1]] = row[2..-1]
      end
      write_to_yaml
      data
    end
    
    def drive_worksheet
      ShameBot::Data::Connection.new.load_worksheet
    end
    
    def write_to_yaml
      File.open("wall_of_shame.yaml","w") do |file|
        file.write @@data.to_yaml
      end 
    end
  end
  
end
