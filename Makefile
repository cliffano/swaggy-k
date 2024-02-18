ci: clean lint test

clean:
	rm -rf example/clients/ rm -rf example/stage/

lint:
	checkmake src/Makefile-swaggy-k

test:
	cd example && \
	  make -f ../src/Makefile-swaggy-k clean deps init-spec generate update-to-latest

release-major:
	rtk release --release-increment-type major

release-minor:
	rtk release --release-increment-type minor

release-patch:
	rtk release --release-increment-type patch

release: release-minor

.PHONY: all ci clean lint test release-major release-minor release-patch
