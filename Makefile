BE = bundle exec

server:
	$(BE) rails s

test_suite_c:
	$(BE) rspec spec/controllers

test_foreclosures_c:
	$(BE) rspec spec/controllers/foreclosures_controller_spec.rb

test_budget_m:
	$(BE) rspec spec/models/budget_spec.rb

.PHONY: server test_suite test_foreclosures test_budget_m
