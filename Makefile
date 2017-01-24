BE = bundle exec

test:
	$(BE) rspec
  
server:
	$(BE) rails s

test_suite_c:
	$(BE) rspec spec/controllers

test_foreclosures_c:
	$(BE) rspec spec/controllers/foreclosures_controller_spec.rb

test_budget_m:
	$(BE) rspec spec/models/budget_spec.rb

.PHONY: test server test_suite_c test_foreclosures_c test_budget_m

