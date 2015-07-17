require "learneroo_gem/version"
require "minitest"

module Minitest
	class ProgressReporter < Reporter
    @@tests = 0

		def record result # :nodoc:
			if options[:verbose]
				io.print "%s#%s = %.2f s = " % [result.class, result.name, result.time]
			else
				io.print "#{result.name} "
			end
			if result.result_code == '.'
				puts '✔'
        @@tests += 1
      else
				puts result.result_code
      end
      report_results(result)
    end

    # report results if wrong or last one.
    def report_results(result)
      api_token = ENV["API_TOKEN"]
      #test_number = result.name[5..6]
      if api_token && (result.result_code != '.' || @@tests == 42) #adjust
        puts "Reporting results"
        test_url = ENV["API_URL"]

        require "uri"
        require "net/http"

        params = {'test_number'=> @@tests,
                  'api_token' => api_token
                }
        x = Net::HTTP.post_form(URI.parse(test_url), params)
        puts x.body
      end
    end

	end
end