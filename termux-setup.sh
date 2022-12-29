export URL=https://github.com/cr4r/qemu-alphine
export BRANCH=main

pkg install -y expect wget qemu-utils qemu-common qemu-system-x86_64-headless openssh

mkdir -p alpine
cd alpine

if [ ! -f "config.env" ]; then
    # get the default config file
    wget -q -c -t0 ${URL}/${BRANCH}/config.env
fi

# URL / BRANCH might be overwritten here
. config.env

wget -q -c -t0 ${URL}/${BRANCH}/answerfile
wget -q -c -t0 ${URL}/${BRANCH}/ssh2qemu.sh
chmod +x ./ssh2qemu.sh
wget -q -c -t0 ${URL}/${BRANCH}/startqemu.sh
chmod +x ./startqemu.sh
wget -q -c -t0 ${URL}/${BRANCH}/installqemu.expect
expect -f installqemu.expect
