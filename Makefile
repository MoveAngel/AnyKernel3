BRANCH := $(shell git -C .. rev-parse --abbrev-ref HEAD)

ifeq ($(findstring 10,$(BRANCH)),10)
    NAME ?= MvAL-Ten-lavender
    DATE := $(shell date "+%Y%m%d-%H%M")
    ZIP := $(NAME)-$(DATE).zip
else
    ROM ?= Unite
    NAME ?= MvAL-$(ROM)-Pie-lavender
    DATE := $(shell date "+%Y%m%d-%H%M")
    ZIP := $(NAME)-$(DATE).zip
endif

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*

normal: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Done."

clean:
	@rm -vf *.zip*
	@rm -vf kernel/*.gz
	@rm -vf dtbs/*.dtb
	@rm -vf modules/vendor/lib/modules/*.ko
	@echo "Done."
