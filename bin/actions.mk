.PHONY: flushall check-ready check-live

host ?= localhost
max_try ?= 30
wait_seconds ?= 1
delay_seconds ?= 0

default: check-ready

flushall:
	echo "flush_all" | nc $(host) 11211 | grep "OK"

check-ready:
	wait_for_memcached $(host) $(max_try) $(wait_seconds) $(delay_seconds)

check-live:
	@echo "OK"
