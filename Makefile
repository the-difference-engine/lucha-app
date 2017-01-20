BE = bundle exec

test:
	$(BE) rspec

server:
	$(BE) rails s

.PHONY: test server
