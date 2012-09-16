cruft_lib = File.expand_path(File.dirname(File.dirname(__FILE__)))

desc "Collect cruft (#cruft:) comments into a single Cruftfile"
task :collect_cruft => :environment do
  require "#{cruft_lib}/cruft/cruft_collector"
  CruftCollector.collect(options)
end
