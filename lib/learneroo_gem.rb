require "learneroo_gem/version"
require "minitest"

module Minitest
	class ProgressReporter < Reporter
		def record result # :nodoc:
			puts "✔" #(for previous test)
			if options[:verbose]
				io.print "%s#%s = %.2f s = " % [result.class, result.name, result.time]
			else
				io.print result.name #[9..-1]
			end
			io.print result.result_code
		end
	end
end
