SRC = src
DEST = $(SRC)/public

ifdef COMP
	COMP = compress
endif

compress:
	[ ! -d $(DEST) ] && mkdir --parents $(DEST) || true
	gzip --recursive --verbose --keep $(DEST)/*/*.css || true
	gzip --recursive --verbose --keep $(DEST)/*.css || true
	gzip --recursive --verbose --keep $(DEST)/*/*.html || true
	gzip --recursive --verbose --keep $(DEST)/*.html || true
	gzip --recursive --verbose --keep $(DEST)/*/*.js || true
	gzip --recursive --verbose --keep $(DEST)/*.js || true
	gzip --recursive --verbose --keep $(DEST)/*/*.json || true
	gzip --recursive --verbose --keep $(DEST)/*.json || true
	gzip --recursive --verbose --keep $(DEST)/*/*.svg || true
	gzip --recursive --verbose --keep $(DEST)/*.svg || true

build: $(COMP)
	[ ! -d $(DEST) ] && mkdir --parents $(DEST) || true
	hugo --source="$(SRC)"

deploy:
	hugo server --disableFastRender --source="$(SRC)"

.PHONY: build deploy
