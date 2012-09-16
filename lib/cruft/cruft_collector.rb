module CruftCollector
  class << self
    def get_files(options={})
      files = []
      begin
        Dir.chdir('app') do
          files = Dir['**/*.rb'] + Dir['**/*.js'] + Dir['**/*.coffee'] + Dir['**/*.css'] +
                  Dir['**/*.scss']
      rescue SystemCallError
        puts "No cruftworthy files found in directory 'app'."
        exit 1
      end
      files
    end

    def get_cruft_from_file(file)
      cruft = []
      cruft_count = -1
      cruft_mode = false
      File.readlines(file).each_with_index do |line, index|
        if cruft_mode && line =~ /^\s*#/
          cruft[cruft_count] += line
        elsif line =~ /^\s*#cruft:/
          cruft_count += 1
          cruft[cruft_count] += "#{DateTime.now.to_s}, File: #{file} Line number: #{index}"
          cruft[cruft_count] += line
          cruft_mode = true
        else
          cruft_mode = false
        end
      end
      cruft
    end

    def collect(options={})
      File.open('Cruftfile', 'w') do |cruftfile|
        get_files.each do |file|
          cruftfile.write(get_cruft_from_file(file).join('\n'))
        end
      end
    end
  end
end
