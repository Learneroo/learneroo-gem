require "learneroo_gem/version"
require "minitest"

module Minitest
	class ProgressReporter < Reporter
		def record result # :nodoc:
			if options[:verbose]
				io.print "%s#%s = %.2f s = " % [result.class, result.name, result.time]
			else
				io.print "#{result.name} "
			end
			if result.result_code == '.'
				puts '✔'
			else
				puts result.result_code
			end
		end
	end
end
