# flatcar-ignition
fichier de configuration pour setup flatcar

## Prérequis
- Une Clé USB avec un Système d'exploitation bootable et utilisable depuis la clé USB (ex. [Fedora](https://www.fedoraproject.org/workstation/), [Ubuntu](https://ubuntu.com/download/desktop))
- Dans le BIOS mettre les disques SATA en mode IDE au lieu de AHCI sans quoi les disques seront vus comme *"removable"*


## Préparation
1. Démarrer l'OS de choix et installer `git`, `wget` et`docker`

---

### Ubuntu
```bash
sudo apt install git wget docker -y
```

### Fedora
```bash
sudo dnf install git wget docker -y
```

---

2. Copier le script d'installation de flatcar avec la commande suivante :
```bash
wget https://raw.githubusercontent.com/flatcar/init/flatcar-master/bin/flatcar-install > flatcar-install.sh
```
3. Cloner ce repositoire
```bash
git clone https://github.com/marvinpac-it/flatcar-ignition.git
```
4. Identifier le disque sur lequel installer Flatcar avec la commande `lsblk`

    **Exemple :**
    ```bash
    xavier@SINGLE-HOST-DOCKER:~$ lsblk 
    NAME                      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
    sda                         8:0    0   360G  0 disk 
    ├─sda1                      8:1    0     1M  0 part 
    ├─sda2                      8:2    0   1.8G  0 part /boot
    └─sda3                      8:3    0 358.2G  0 part 
    └─ubuntu--vg-ubuntu--lv 252:0    0 358.2G  0 lvm  /
    sr0                        11:0    1  1024M  0 rom  
    ```
    Prendre le disque le avec le moins de taille possible pour l'installation. 
## Utilisation
1. Modifier la commande suivante et l'éxecuter, il faut changer le nom *(ex. `flatcar51`)* par un nom unique ainsi que l'adresse IP par une IP qui n'est pas en utilisation.
```bash
bash flatcar-ignition/transpile.sh flatcar01 192.168.77.101 > ignition.json
```
Remplacer `flatcar01` par le nom de serveur souhaité, et `/dev/sda` par le disque sur lequel installer.

2. Installer flatcar avec la commande suivante en exemple :
```bash
flatcar-install -d /dev/sda -i ignition.json -C stable
```
Remplacer le disque après le flag `-d` par le disque identifié dans la **partie préparation**
3. Une fois installé, éteindre la machine, enlever la clé USB et booter sur flatcar.
