#!/bin/bash

. $TESTROOT/etc/config
. $TESTROOT/libs/utils

setup() {
    echo
    echo "--- start with default config"
    ${KAMBIN} -P ${KAMPID} -w ${KAMRUN} -Y ${KAMRUN} -a no
    sleep 1
}

teardown() {
    kill_pidfile ${KAMPID}
}

test_usrloc_alice() {
    echo
    echo "--- start sipsak -vvv -U -I -H 127.0.0.1 -s sip:alice@127.0.0.1"
    sipsak -vvv -U -I -H 127.0.0.1 -s sip:alice@127.0.0.1 2>&1 | tee /tmp/kamailio-tulocx0001.log &
    sleep 1
    echo
    echo "--- grep output"
    echo
    grep "usrloc for alice completed successful" /tmp/kamailio-tulocx0001.log
}

run_test test_usrloc_alice
