#include "chisel-jar.bash"

if [[ "$1" == "" ]]
then
    echo "chisel-jargen <out>: Generates a Chisel JAR file"
    echo "  --hash: Lists the hash that will be generated"
    echo "  --version: Lists the version that will be generated"
    exit 1
fi

if [[ "$1" == "--version" ]]
then
    echo $CHISEL_VERSION
    exit 0
fi

if [[ "$1" == "--hash" ]]
then
    echo $CHISEL_HASH
    exit 0
fi

cat $CHISEL_JAR_DIR/headers.tar > $1
