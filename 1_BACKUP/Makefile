.PHONY: build \
	1_backup_default \
	2_restore_default \
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
	8_show_experiment

build:
	docker compose down -v && docker compose up -d --build

1_backup_default:
	./scripts/backup_default.sh

2_restore_default:
	./scripts/restore_default.sh

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
