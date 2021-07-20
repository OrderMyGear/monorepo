GHORG		:= OrderMyGear
REPOS		:= $(shell gh repo list $(GHORG) --no-archived -L 200 | awk '/\// { print $$1 }' | grep -v monorepo )

.PHONEY:	all

all: $(REPOS)

$(REPOS):
	@- git submodule add --depth 1 git@github.com:$@ 2>/dev/null && echo $@

