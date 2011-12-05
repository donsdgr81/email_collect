# To use just run the command:
# ruby compile_email.rb [FILENAME]
# Result file will be available at result.txt

class CompileEmail

  def initialize(old_file)
    @old_file = old_file
    @new_file = "result.txt"
    @emails = []
  end

  def process_file
    read_old_file
    create_new_file
    puts "Process complete"
  end

  private

  def read_old_file
    puts "=============================="
    puts "Reading #{@old_file}"
    puts "=============================="
    File.open(@old_file) do |file|
      # read the whole file to convert to string then split with either choosing between \r, \n or \r\n
      file.read.split(/\r|\n|\r\n/).each do |line|
        @emails << clean_and_add_quotes(line)
      end
    end
  end

  def create_new_file
    puts "=============================="
    puts "Writing emails to result.txt"
    puts "=============================="
    File.open(@new_file, "w+") do |file|
      file.write(@emails.join(","))
    end
  end

  def clean_and_add_quotes(line)
    str = "\"#{line.strip.downcase}\""
    puts "storing: #{str}"
    str
  end

end

CompileEmail.new("#{ARGV[0]}").process_file