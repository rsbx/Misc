#!/bin/sh

REPOS="go gofrontend"

for REPO in ${REPOS}; do
	        echo '---------------------------------------------------------------------'
	( cd ${REPO}.hg \
			&& hg incoming \
			&& hg pull \
			&& hg update \
	) \
	&& ( cd ${REPO}.git \
			&& ../fast-export.git/hg-fast-export.sh --quiet \
			&& git-push --all git@github.com:rsbx/${REPO}.git
	)
done
echo '---------------------------------------------------------------------'
date
