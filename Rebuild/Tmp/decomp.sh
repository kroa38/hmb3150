#! /bin/sh
# Script automatique de deballage du Firmware
# GeekyHMB 1.0 2011/04/20

if [ -r ../install.img ]; then # Teste si le fichier install.img est bien la
  echo "creation du dossier de travail"
  mkdir ../install
  ICI=`pwd`
  cd ../install
  echo "extraction du contenu de install.img"
  tar xvf ../install.img 
  echo "ancien Firmware renome en .old"
  mv ../install.img ../install.img.old
  echo "creation des dossiers yaffs"
  cd package2
  mkdir yaffs2_1
  mkdir yaffs2_2
  cd yaffs2_1
  echo "Decompression yaffs2_1"
  ${ICI}/unyaffs ../yaffs2_1.img 
  cd ../yaffs2_2
  echo "Decompression yaffs2_2"
  ${ICI}/unyaffs ../yaffs2_2.img
  cd ..
  rm yaffs2_1.img yaffs2_2.img
  echo "retour dans le dossier de depart"
  cd ${ICI}
  chmod -R 777 ../install
else
  echo "le Firmware est introuvable"
  exit 1
fi




