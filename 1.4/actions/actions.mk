.PHONY: flushall check-ready check-live

host ?= localhost
max_try ?= 30
wait_seconds ?= 1

default: check-ready

flushall:
	echo "flush_all" | nc $(host) 11211 | grep "OK"

check-ready:
	wait-for-memcached.sh $(host) $(max_try) $(wait_seconds)

check-live:
	@echo "OK"
