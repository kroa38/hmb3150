#! /bin/sh
# Script automatique de reconstruction du Firmware
# GeekyHMB 1.0 2011/04/20

if [ -d ../install ]; then # Teste si le dossier install est bien la
  ICI=`pwd`
  cd ../install/package2

  echo "Compression yaffs2_1"
  ${ICI}/mkyaffs2image yaffs2_1 yaffs2_1.img
  chmod 777 yaffs2_1.img
  rm -r yaffs2_1

  echo "Compression yaffs2_2"
  ${ICI}/mkyaffs2image yaffs2_2 yaffs2_2.img
  chmod 777 yaffs2_2.img
  rm -r yaffs2_2

  cd ..
  tar cvf ../install.img *
  cd ..
  chmod 777 install.img

  rm -r install
  cd ${ICI}
else
  echo "le dossier install est introuvable"
  exit 1
fi
