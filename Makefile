PACKAGE   := ncurses-menu
VERSION   := 1.0
COMMIT    := d22a2ab
REPO      := https://github.com/minios-linux/ncurses-menu.git
BUILD_DIR := build/$(PACKAGE)-$(VERSION)

.PHONY: all clone orig add-debian build-package clean

all: build-package

clone:
	@echo "Cloning $(REPO) at commit $(COMMIT)..."
	@mkdir -p build
	@git clone $(REPO) $(BUILD_DIR)
	@cd $(BUILD_DIR) && git checkout $(COMMIT)
	@rm -rf $(BUILD_DIR)/.git

orig: clone
	@echo "Creating original tarball..."
	@tar czf build/$(PACKAGE)_$(VERSION).orig.tar.gz -C build $(PACKAGE)-$(VERSION)

add-debian: orig
	@echo "Adding debian directory..."
	@cp -r debian $(BUILD_DIR)/

build-package: add-debian
	@echo "Building package..."
	@cd $(BUILD_DIR) && dpkg-buildpackage -us -uc

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf build
