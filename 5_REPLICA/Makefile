.PHONY: build run citus

build:
	docker compose down -v && docker compose up -d --build

run:
	./scripts/check-replication.sh

citus:
	./scripts/check-citus.sh

citus-run:
	docker compose -f citus_cluster/docker-compose.yml down -v
	docker compose -f citus_cluster/docker-compose.yml up -d --build

report_pdf:
	pandoc report.md -o report.pdf \
		--from=markdown+emoji+raw_tex \
		--pdf-engine=/Library/TeX/texbin/xelatex \
		--syntax-highlighting=tango \
		-V geometry:margin=2cm -V colorlinks=true \
		-V mainfont="Times New Roman" -V monofont="Menlo" \
		--resource-path=".:assets"
