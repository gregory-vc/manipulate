.PHONY: build run

build:
	docker compose down -v && docker compose up -d --build

run:
	./scripts/harmonic_mean.sh

report_pdf:
	pandoc report.md -o report.pdf \
		--from=markdown+emoji+raw_tex \
		--pdf-engine=/Library/TeX/texbin/xelatex \
		--syntax-highlighting=tango \
		-V geometry:margin=2cm -V colorlinks=true \
		-V mainfont="Times New Roman" -V monofont="Menlo" \
		--resource-path=".:assets"