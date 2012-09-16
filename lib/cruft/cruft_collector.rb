module CruftCollector
  class << self
    def app_dir
      @app_dir || "app"
    end

    def app_dir=(dir)
      @app_dir = dir
    end

    def get_files(options={})
      files = []
      begin
        Dir.chdir(app_dir) do
          files = Dir['**/*.rb'] + Dir['**/*.js'] + Dir['**/*.coffee'] + Dir['**/*.css'] +
                  Dir['**/*.scss']
        end
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

      File.readlines(File.join(app_dir, file)).each_with_index do |line, index|
        if cruft_mode && line =~ /^\s*#/
          cruft[cruft_count] += line
        elsif line =~ /^\s*#cruft:/
          cruft_count += 1
          cruft[cruft_count] = "#{DateTime.now.to_s}, File: #{file} Line number: #{index}\n"
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
