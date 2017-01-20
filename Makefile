BE = bundle exec

test:
	$(BE) rspec

server:
	$(BE) rails s

test_suite:
	$(BE) rspec spec/controllers

test_foreclosures:
	$(BE) rspec spec/controllers/foreclosures_controller_spec.rb

.PHONY: server test_suite test_foreclosures

