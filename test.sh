#! /bin/sh

# bash_unit
if ls test/*.bash_unit > /dev/null 2>&1; then
	echo "
Running bash_unit tests:"
	./test/lib/bash_unit test/*.bash_unit
	RETURN_BASH_UNIT=$?
else
	RETURN_BASH_UNIT=0
fi

# bats
if ls test/*.bats > /dev/null 2>&1; then
	echo "
Running bats tests:"
	./test/lib/bats/bats test
	## or:
	# bats test
	RETURN_BATS=$?
else
	RETURN_BATS=0
fi


if [ 0 -eq "$RETURN_BASH_UNIT" ] && [ 0 -eq "$RETURN_BATS" ] ; then
	echo 'All tests pass!'
	exit 0
else
	echo 'Some tests fail!'
	exit 1
fi
