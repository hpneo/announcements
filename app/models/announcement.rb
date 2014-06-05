class Announcement < ActiveRecord::Base
  unloadable

  belongs_to :user

  def self.semesters
    (2014..Date.today.year).map { |year|
      ["#{year}-0", "#{year}-1", "#{year}-2"]
    }.flatten
  end

  def self.current_semester
    month = Date.today.month
    
    semester = if month.between?(1, 2)
      "0"
    elsif month.between?(3, 7)
      "1"
    elsif month.between?(8, 12)
      "2"
    end

    "#{Date.today.year}-#{semester}"
  end
end
