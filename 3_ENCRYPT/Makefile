build:
	mkdir -p shared-ssl && rm -rf shared-ssl/*
	docker compose down -v && docker compose up -d --build

run:
	./scripts/demo.sh

report_pdf:
	pandoc report.md -o report.pdf \
		--from=markdown+emoji+raw_tex \
		--pdf-engine=/Library/TeX/texbin/xelatex \
		--syntax-highlighting=tango \
		-V geometry:margin=2cm -V colorlinks=true \
		-V mainfont="Times New Roman" -V monofont="Menlo" \
		--resource-path=".:assets"