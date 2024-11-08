VERSION=libz_1.3.1ubuntu.amd64

all: clean pullsource buildsource builddeb

builddeb:
	mkdir -p $(VERSION)/DEBIAN
	cp control $(VERSION)/DEBIAN
	cp postinst $(VERSION)/DEBIAN
	chmod 0755 $(VERSION)/DEBIAN/postinst
	mkdir -p $(VERSION)/bin
	mkdir -p $(VERSION)/usr/bin
	cp /usr/local/bin/bash $(VERSION)/usr/bin
	cp /usr/bin/bashbug $(VERSION)/usr/bin
	cp /usr/bin/clear_console $(VERSION)/usr/bin
	mkdir -p $(VERSION)/etc
	cp /etc/bash.bashrc $(VERSION)/etc
	cp /usr/bin/clear_console $(VERSION)/usr/bin
	mkdir -p $(VERSION)/usr/share
	mkdir -p $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/COMPAT.gz  $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/COMPAT.gz $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/INTRO.gz $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/NEWS.gz $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/POSIX.gz $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/RBASH $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/README.Debian.gz $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/README.abs-guide $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/README.commands.gz $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/README.gz $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/changelog.Debian.gz $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/copyright $(VERSION)/usr/share/doc/bash
	cp /usr/share/doc/bash/inputrc.arrows $(VERSION)/usr/share/doc/bash
	mkdir -p $(VERSION)/usr/share/info
	mkdir -p $(VERSION)/usr/share/lintian/overrides
	cp /usr/share/lintian/overrides/bash $(VERSION)/usr/share/lintian/overrides
	mkdir -p $(VERSION)/usr/share/man
	mkdir -p $(VERSION)/usr/share/man/man1
	cp /usr/share/man/man1/bash.1.gz $(VERSION)/usr/share/man/man1
	cp /usr/share/man/man1/bashbug.1.gz $(VERSION)/usr/share/man/man1
	cp /usr/share/man/man1/clear_console.1.gz $(VERSION)/usr/share/man/man1
	cp /usr/share/man/man1/rbash.1.gz $(VERSION)/usr/share/man/man1
	mkdir -p $(VERSION)/usr/share/man/man7
	cp /usr/share/man/man7/bash-builtins.7.gz $(VERSION)/usr/share/man/man7
	mkdir -p $(VERSION)/usr/share/menu
	cp /usr/share/menu/bash $(VERSION)/usr/share/menu
	md5sum $(VERSION)/usr/bin/bash > md5sums
	md5sum $(VERSION)/usr/bin/bashbug >> md5sums
	md5sum $(VERSION)/usr/bin/clear_console >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/COMPAT.gz >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/INTRO.gz >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/NEWS.gz >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/POSIX.gz >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/RBASH >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/README.Debian.gz >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/README.abs-guide >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/README.commands.gz >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/README.gz >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/changelog.Debian.gz >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/copyright >> md5sums
	md5sum $(VERSION)/usr/share/doc/bash/inputrc.arrows >> md5sums
	md5sum $(VERSION)/usr/share/lintian/overrides/bash >> md5sums
	md5sum $(VERSION)/usr/share/man/man1/bash.1.gz >> md5sums
	md5sum $(VERSION)/usr/share/man/man1/bashbug.1.gz >> md5sums
	md5sum $(VERSION)/usr/share/man/man1/clear_console.1.gz >> md5sums
	md5sum $(VERSION)/usr/share/man/man1/rbash.1.gz  >> md5sums
	md5sum $(VERSION)/usr/share/man/man7/bash-builtins.7.gz >> md5sums
	md5sum $(VERSION)/usr/share/menu/bash >> md5sums
	cp md5sums $(VERSION)/DEBIAN
	dpkg-deb --build $(VERSION)

clean:
	echo "Running CLEAN:"
	rm -rf $(VERSION)
	rm -rf $(VERSION).deb
	rm -rf md5sums

pullsource:
	wget -P ~/source wget https://zlib.net/zlib-1.3.1.tar.gz ; \
	exit 0
	
buildsource:
	cd ~/source
	tar -xzf zlib-1.3.1.tar.gz
	cd zlib-1.3.1
	make
	make install