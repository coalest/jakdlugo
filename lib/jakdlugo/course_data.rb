require "pg"
require_relative "helpers"

class CourseData
  include Helpers

  def initialize
    @connection = db_connection
    setup_db
  end

  def course_summary(course)
    return unless valid_course?(course)

    course = ASSESSMENTS.key(course) if ASSESSMENTS.values.include?(course)
    hours_arr = course_info(course)
    display_course_summary(course, hours_arr)
  end

  def track_summary(track)
    return unless valid_track?(track)

    courses_and_hours = track_info(track)
    display_track_summary(courses_and_hours)
  end

  def progress_summary(track, course)
    return unless valid_track?(track) && valid_course?(course)

    hash = track_info(track).map { |course, _, percent| [course, percent] }.to_h
    course = ASSESSMENTS.key(course) if ASSESSMENTS.values.include?(course)
    you_are_here = hash.keys.index(course)
    return display_bad_course_error unless you_are_here

    percent = hash.values[0..you_are_here].reduce(:+).round

    display_progress_summary(course, percent)
  end

  private

  # Return database connection, creating a new database if it doesn't exist yet.
  def db_connection
    begin
      PG.connect(dbname: "ls_course_data")
    rescue PG::ConnectionBad
      connection = PG.connect(dbname: "postgres")
      connection.exec("CREATE DATABASE ls_course_data")
      PG.connect(dbname: "ls_course_data")
    end
  end

  # Load database schema and data from sql file if tables don't exist
  def setup_db
    sql = <<~SQL
      SELECT COUNT(*) FROM information_schema.tables
      WHERE table_schema = 'public' AND table_name =
      ANY ('{courses, hours, students}'::text[]);
    SQL

    num_tables = query(sql).getvalue(0, 0).to_i
    return if num_tables >= 3

    file_path = File.dirname(__FILE__) + "/../../course_data.sql"
    setup_sql = File.read(file_path)
    @connection.exec(setup_sql)
  end

  # Wrapper method for database queries
  def query(statement, *params)
    @connection.exec(statement, params)
  end

  # Returns an array of reported hours for a course
  def course_info(course)
    sql = <<~SQL
      SELECT round(h.hours) AS hours FROM public.hours AS h
      JOIN public.courses AS c ON c.id = h.course_id WHERE c.name = $1;
    SQL

    result = query(sql, course)
    result.map { |tuple| tuple["hours"].to_i }
  end

  # Returns a sorted array with the names, avg study hours, and percent of
  # total hours for courses in a given track
  def track_info(track)
    track = format_track(track)
    course_arr = avg_course_hours(track)
    courses = track == "ruby" ? RB_TRACK : JS_TRACK

    course_arr.select! { |arr| courses.include?(arr.first) }
    course_arr.sort_by { |el| courses.index(el.first) }
  end

  # Returns an array for each course in an LS track with course name, average
  # study hours, and the percent of total hours.
  def avg_course_hours(track)
    sql = <<~SQL
      SELECT c.name, round(avg(h.hours)) AS avg,
      round(avg(h.hours) / $1 * 100, 1) AS percent FROM public.hours AS h
      JOIN public.courses AS c ON c.id = h.course_id
      JOIN public.students AS s ON h.student_id = s.id
      WHERE s.track = $2 GROUP BY c.name;
    SQL

    result = query(sql, total_hours(track), track)
    result.map { |tuple| [tuple["name"], tuple["avg"].to_i, tuple["percent"].to_f] }
  end

  # return the total number of hours a track takes on average
  def total_hours(track)
    sql = <<~SQL
      SELECT sum(avg_hours) FROM (
        SELECT round(avg(hours)) AS avg_hours FROM public.hours
        JOIN public.courses ON courses.id = hours.course_id
        JOIN public.students ON students.id = hours.student_id
        WHERE students.track = $1 GROUP BY courses.name ) AS subq;
    SQL

    results = query(sql, track)
    tuple = results.first
    tuple["sum"].to_i
  end

  def display_course_summary(course, course_data)
    course = include_assessment(course).upcase
    avg = (course_data.reduce(:+) / course_data.size.to_f).round

    puts "Course: #{course}\n"\
         "Average number of study hours to complete: #{avg}\n"\
         "Data points (n=#{course_data.size}): #{course_data.sort.join(", ")}"
  end

  def display_track_summary(course_arr)
    puts <<~HEREDOC
         Course    | Average number | Percent of
                   |    of hours    | total time
      -------------|----------------|------------
    HEREDOC

    course_arr.each do |course, hours, percent|
      puts " #{include_assessment(course).upcase.ljust(12)}|       "\
            "#{hours.to_s.ljust(9)}|    "\
            "#{percent.to_f}"
    end

    total_hours = course_arr.map { |arr| arr[1] }.reduce(:+).to_s

    puts "-------------|----------------|------------"
    puts " Total       |       #{total_hours.ljust(9)}|    100"
  end

  def display_progress_summary(course, percent)
    course = include_assessment(course).upcase

    puts "When you finish #{course}, you will be approx. #{percent}% done with Core!"
  end
end
