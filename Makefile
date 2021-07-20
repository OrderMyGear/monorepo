GHORG		:= OrderMyGear
REPOS		:= $(shell gh repo list $(GHORG) --no-archived -L 200 | awk '/\// { print $$1 }' )

.PHONEY:	all

all: $(REPOS)

$(REPOS):
	git submodule add --depth 1 git@github.com:$@

