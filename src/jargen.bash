#include "chisel-params.bash"

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

ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0`
tail -n+$ARCHIVE $0 | base64 --decode > $1

exit 0
__ARCHIVE_BELOW__
#include "chisel-jar.bash"
