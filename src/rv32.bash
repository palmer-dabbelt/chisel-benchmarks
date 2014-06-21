#include "riscv-sodor-tar.bash"

if [[ "$1" == "" ]]
then
    echo "$1 <Top.flo> <VCDs.tar>: Generates a Chisel JAR file"
    echo "  --sodor-hash: Lists the SODOR hash"
    echo "  --fesvr-hash: Lists the fesvr hash"
    echo "  --chisel-hash: Lists the Chisel hash"
    exit 1
fi

if [[ "$1" == "--sodor-hash" ]]
then
    echo $SODOR_HASH
    exit 0
fi

if [[ "$1" == "--fesvr-hash" ]]
then
    echo $FESVR_HASH
    exit 0
fi

if [[ "$1" == "--chisel-hash" ]]
then
    echo $CHISEL_HASH
    exit 0
fi

cat $SODOR_DIR/rv32_1stage.flo > $1
cat $SODOR_DIR/rv32_1stage.tar > $2
