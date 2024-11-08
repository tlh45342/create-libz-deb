VERSION=libz_1.3.1ubuntu.amd64

all: clean pullsource buildsource builddeb

builddeb:
	mkdir -p $(VERSION)/DEBIAN
	cp control $(VERSION)/DEBIAN
	cp preinst $(VERSION)/DEBIAN
	cp postinst $(VERSION)/DEBIAN
	chmod 0755 $(VERSION)/DEBIAN/postinst
	mkdir -p $(VERSION)/usr
	mkdir -p $(VERSION)/usr/local
	mkdir -p $(VERSION)/usr/local/lib
	cp libz.a $(VERSION)/usr/bin
	cp libz.a $(VERSION)/usr/local/lib
	chmod 644 $(VERSION)/usr/local/lib/libz.a
	cp libz.so.1.3.1 $(VERSION)/usr/local/lib
	chmod 755 $(VERSION)/usr/local/lib/libz.so.1.3.1
	mkdir -p $(VERSION)/usr
	mkdir -p $(VERSION)/usr/share
	mkdir -p $(VERSION)/usr/share/man
	mkdir -p $(VERSION)/usr/share/man/man3
	cp zlib.3 $(VERSION)/usr/local/share/man/man3
	chmod 644 $(VERSION)/usr/local/share/man/man3/zlib.3
	mkdir -p $(VERSION)/usr/local/lib/pkgconfig
	cp zlib.pc $(VERSION)/usr/local/lib/pkgconfig
	chmod 644 $(VERSION)/usr/local/lib/pkgconfig/zlib.pc
	cp zlib.h zconf.h $(VERSION)/usr/local/include
	chmod 644 $(VERSION)/usr/local/include/zlib.h $(VERSION)/usr/local/include/zconf.h
	md5sum $(VERSION)/usr/local/lib/libz.a > md5sums
	md5sum $(VERSION)/usr/local/lib/libz.so.1.3.1 >> md5sums
	md5sum $(VERSION)/usr/local/share/man/man3/zlib.3 >> md5sums
	md5sum $(VERSION)/usr/local/lib/pkgconfig/zlib.pc >> md5sums
	md5sum $(VERSION)/usr/local/include/zlib.h >> md5sums
	md5sum $(VERSION)/usr/local/include/zconf.h >> md5sums
	cp md5sums $(VERSION)/DEBIAN
	dpkg-deb --build $(VERSION)

clean:
	echo "Running CLEAN:"
	rm -rf $(VERSION)
	rm -rf $(VERSION).deb
	rm -rf md5sums

pullsource:
	rm -rf ~/source/zlib-1.3.1.tar.gz ; \
	wget -P ~/source wget https://zlib.net/zlib-1.3.1.tar.gz ; \
	exit 0
	
buildsource:
	cd ~/source ; \
	tar -xzf zlib-1.3.1.tar.gz ; \
	cd zlib-1.3.1 ; \
	./configure ; \
	make ; \
	make install