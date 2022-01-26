module Helpers
  RB_TRACK = %w[ls95 rb100 rb101 rb120 rb130 ls170 rb175 ls180 rb185
                ls202 js210 ls215 js225 js230]
  JS_TRACK = %w[ls95 js100 js101 js120 js130 ls170 js175 ls180 js185
                ls202 ls215 js230]
  ASSESSMENTS = { "rb101" => "rb109", "rb120" => "rb129", "rb130" => "rb139",
                  "js101" => "js109", "js120" => "js129", "js130" => "js139",
                  "ls170" => "ls171", "ls180" => "ls181", "ls215" => "ls216",
                  "js230" => "js239", "js210" => "js211", "js225" => "js229" }

  # returns a valid track or prints an error
  def valid_track?(track)
    return true if %w[ruby javascript rb js].include?(track)

    puts "Track not found. Please choose ruby (rb) or javascript (js)."
  end

  # returns a valid course or prints an error
  def valid_course?(course)
    return true if (RB_TRACK + JS_TRACK + ASSESSMENTS.values).include?(course)

    puts "Course not found. Use this formats: ls95, RB101, JS129, etc."
  end

  # return long form of each track if abbreviation was given
  def format_track(track)
    case track
    when "rb", "ruby"       then "ruby"
    when "js", "javascript" then "javascript"
    end
  end

  # concatenate the assessment onto the course name if it exists
  def include_assessment(course)
    has_assessment?(course) ? "#{course}/#{ASSESSMENTS[course]}" : course
  end

  # return true if a course has an assessment
  def has_assessment?(course)
    ASSESSMENTS.include?(course)
  end
end
