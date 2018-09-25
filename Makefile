PREFIX=$(HOME)

ALL_FILES = $(wildcard *)
EXCLUDED_FILES = Makefile README.md

FILTERED_FILES = $(filter-out $(EXCLUDED_FILES),$(ALL_FILES))
DOT_FILES = $(addprefix $(PREFIX)/.,$(FILTERED_FILES))

DIRS = $(PREFIX)

ifneq ($(filter backup,$(MAKECMDGOALS)),)
BACKUP_DIR=$(HOME)/backup
INSTALLED_FILES=$(wildcard $(PREFIX)/.*)
FILES_TO_BACKUP=$(filter $(DOT_FILES),$(addprefix $(PREFIX)/,$(notdir $(INSTALLED_FILES))))
BACKUP_FILES=$(addprefix $(BACKUP_DIR)/,$(notdir $(FILES_TO_BACKUP)))
DIRS += $(BACKUP_DIR)

.PHONY : backup
backup : $(BACKUP_FILES)
$(BACKUP_DIR)/.% : $(PREFIX)/.% | $(BACKUP_DIR)
	cp -r $< $@
else
.PHONY : install
install : $(DOT_FILES)
$(PREFIX)/.% : $(PWD)/% | $(PREFIX)
	rm -rf $@
	ln -s $< $@
endif

.PHONY : clean
clean:
	rm -rf $(DOT_FILES)

$(DIRS) :
	mkdir $@
