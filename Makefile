# default build target
all::

all:: build
.PHONY: all start benchmark_nats benchmark_stan benchmark_all

start_nats:

	docker-compose up -d nats_1 # primary
	sleep 20

	docker-compose up -d nats_2
	sleep 10

	docker-compose up -d nats_3
	sleep 10

start_stan:

	docker-compose up -d stan_1  # seed
	sleep 20

	docker-compose up -d stan_2
	sleep 10

	docker-compose up -d stan_3
	sleep 10

start: start_nats start_stan

	docker-compose logs --follow

benchmark_nats:

	docker-compose run nats_bench

benchmark_stan:

	docker-compose run stan_bench

benchmark_all: benchmark_nats benchmark_stan
