PREFIX ?= /usr

BACKGROUNDS = \
	$(wildcard backgrounds/*.jpg) \
	$(wildcard backgrounds/*.png)

install_icons:
	for size in 16 32 64 128 256 512; do \
		install -Dm0644 icons/noid-logo-$${size}.png \
			$(DESTDIR)$(PREFIX)/share/icons/hicolor/$${size}x$${size}/apps/noid-logo.png; \
		install -Dm0644 icons/noid-logo-notext-$${size}.png \
			$(DESTDIR)$(PREFIX)/share/icons/hicolor/$${size}x$${size}/apps/noid-logo-notext.png; \
	done

install_logo:
	install -Dm0644 logo/splash.png \
		$(DESTDIR)$(PREFIX)/share/noid-artwork/splash.png
	install -Dm0644 logo/noid-logo.png \
		$(DESTDIR)$(PREFIX)/share/noid-artwork/noid-logo.png

install_backgrounds:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/backgrounds
	install -m0644 ${BACKGROUNDS} \
		$(DESTDIR)$(PREFIX)/share/backgrounds
	install -dm0755 \
		$(DESTDIR)$(PREFIX)/share/gnome-background-properties
	install -m0644 backgrounds/noid.xml \
		$(DESTDIR)$(PREFIX)/share/gnome-background-properties/noid.xml

install_wallpapers:
	cp -r wallpapers/. $(DESTDIR)$(PREFIX)/share/wallpapers

install: install_icons install_logo install_backgrounds install_wallpapers

.PHONY: install install_icons install_logo install_backgrounds install_wallpapers
