.PHONY: build \
	1_backup_custom \
	2_restore_custom \
	3_backup_sections \
	3_sections_pre \
	3_sections_data \
	3_sections_post \
	4_backup_types \
	4_type_schema \
	4_type_data \
	5_backup_directory \
	6_restore_directory \
	7_show_update_experiment \
	8_show_experiment \
	run_all \
	report_pdf

build:
	docker compose down -v && docker compose up -d --build

1_backup_custom:
	./scripts/backup_custom.sh db1_custom.dump

2_restore_custom:
	./scripts/restore_custom.sh ./backups/db1_custom.dump

3_backup_sections:
	./scripts/backup_plain_sections.sh

3_sections_pre:
	./scripts/backup_plain_sections.sh pre-data

3_sections_data:
	./scripts/backup_plain_sections.sh data

3_sections_post:
	./scripts/backup_plain_sections.sh post-data

4_backup_types:
	./scripts/backup_plain_types.sh

4_type_schema:
	./scripts/backup_plain_types.sh schema

4_type_data:
	./scripts/backup_plain_types.sh data

5_backup_directory:
	./scripts/backup_directory.sh

6_restore_directory:
	./scripts/restore_directory.sh

7_show_update_experiment:
	./scripts/show_update_experiment.sh

8_show_experiment:
	./scripts/show_experiment.sh

run_all:
	$(MAKE) build
	$(MAKE) 1_backup_custom
	$(MAKE) 7_show_update_experiment
	$(MAKE) 2_restore_custom
	$(MAKE) 8_show_experiment
	$(MAKE) 3_backup_sections
	$(MAKE) 3_sections_pre
	$(MAKE) 3_sections_data
	$(MAKE) 3_sections_post
	$(MAKE) 4_backup_types
	$(MAKE) 4_type_schema
	$(MAKE) 4_type_data
	$(MAKE) 5_backup_directory
	$(MAKE) 6_restore_directory

report_pdf:
	pandoc report.md -o report.pdf \
		--from=markdown+emoji+raw_tex \
		--pdf-engine=/Library/TeX/texbin/xelatex \
		--syntax-highlighting=tango \
		-V geometry:margin=2cm -V colorlinks=true \
		-V mainfont="Times New Roman" -V monofont="Menlo" \
		--resource-path=".:assets"
