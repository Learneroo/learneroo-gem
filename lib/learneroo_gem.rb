require "learneroo_gem/version"
require "minitest"

module Minitest
	class ProgressReporter < Reporter
    @@tests = 0 #counts passed tests (more general than test names)

    # modify test output
		def record(result)
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
      report_results(result, @@tests)
    end

    # report results when wrong or last one
    def report_results(result, score)
      api_token = ENV["API_TOKEN"]
      test_url = ENV["API_URL"]
      track_id = ENV["TRACK_ID"]

      test_number = result.name[5..6]
      if test_number == "58" #final test code
        puts "Congratulations on passing the tests!"
        passed_tests = true
      end

      if api_token && test_url && (result.result_code != '.' || passed_tests)
        puts "Reporting results..."
        require "net/http"
        params = {'test_number'=> score,
                  'api_token' => api_token,
                  'track_id' => track_id
                }
        begin
          res = Net::HTTP.post_form(URI.parse(test_url), params)
          if res.code == "200"
            puts "Results successfully submitted to #{test_url}"
          end
        rescue
          puts "Failed to submit results."
        end
      end
    end

	end
end