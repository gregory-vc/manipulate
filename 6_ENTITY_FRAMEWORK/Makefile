DOCKER_COMPOSE ?= docker compose

.PHONY: db-up generate run

db-up:
	$(DOCKER_COMPOSE) up -d db

generate: db-up
	$(DOCKER_COMPOSE) exec db bash /workspace/scripts/generate.sh

run:
	dotnet run --project app

build:
	docker compose down -v && docker compose up -d --build

report_pdf:
	pandoc report.md -o report.pdf \
		--from=markdown+emoji+raw_tex \
		--pdf-engine=/Library/TeX/texbin/xelatex \
		--syntax-highlighting=tango \
		-V geometry:margin=2cm -V colorlinks=true \
		-V mainfont="Times New Roman" -V monofont="Menlo" \
		--resource-path=".:assets"


report_emacs:
	pandoc test.md -o report_2.pdf \
		--from=markdown+emoji+raw_tex \
		--pdf-engine=/Library/TeX/texbin/xelatex \
		--syntax-highlighting=tango \
		-V geometry:margin=2cm -V colorlinks=true \
		-V mainfont="Times New Roman" -V monofont="Menlo" \
		--resource-path=".:assets"
