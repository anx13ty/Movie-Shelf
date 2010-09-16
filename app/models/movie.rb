class Movie < ActiveRecord::Base
  attr_accessible :media_format, :title, :copies_at_home, :order, :notes, :rating
  require 'csv'
  
  
  protected
  
  def self.import_movies()
    CSV.foreach('public/uploads/VideoTitles.csv') do |row|
        record = Movie.new(
            :media_format   => row[0], 
            :title          => row[1],  
            :order          => row[2]
        )
        record.save!  
    end
  end
  
  def self.get_yearly_count
    find(:all, :conditions => ["created_at >= ? AND created_at <= ?", Time.now.beginning_of_year, Time.now])
  end
  
  def self.get_monthly_count
    find(:all, :conditions => ["created_at >= ? AND created_at <= ?", Time.now.beginning_of_month, Time.now])
  end
  
end
