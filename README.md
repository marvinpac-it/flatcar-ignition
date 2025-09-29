# flatcar-ignition
fichier de configuration pour setup flatcar

## Prérequis
- Une Clé USB avec le ISO de [flatcar version Stable](https://www.flatcar.org/releases). 
- Dans le BIOS mettre les disques SATA en mode IDE au lieu de AHCI sans quoi les disques seront vus comme "removable"

## Utilisation
Démarrer FlatCar avec l'image ISO sur le PC à déployer puis exécuter les instructions suivantes

    git clone https://github.com/marvinpac-it/flatcar-ignition.git
    bash flatcar-ignition/transpile.sh flatcar01 192.168.77.101 > ignition.json
    flatcar-install -d /dev/sda -i ignition.json -C stable

Remplacer `flatcar01` par le nom de serveur souhaité, et `/dev/sda` par le disque sur lequel installer.
