PAGE = mailing-lists/index.html

all: $(PAGE)

$(PAGE): test.pl
	perl test.pl

upload: all
	bash upload.sh
