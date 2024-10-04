module JournalsHelper
  
  def dateToday
    Time.now.utc.strftime("%Y-%m-%d")
  end

end
