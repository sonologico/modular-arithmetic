build:
	jbuilder build

utop:
	jbuilder utop src

test:
	jbuilder runtest

install:
	jbuilder install

clean:
	jbuilder clean

.PHONY: build utop test install clean
