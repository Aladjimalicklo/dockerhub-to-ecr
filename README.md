# 🚀 Migrer des images Docker de Docker Hub vers AWS ECR

![AWS](https://img.shields.io/badge/AWS-ECR-orange?logo=amazonaws&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Hub-blue?logo=docker)
![Shell Script](https://img.shields.io/badge/Script-Bash-4EAA25?logo=gnubash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📦 Objectif

Ce script **automatise la migration** de vos images Docker hébergées sur [Docker Hub](https://hub.docker.com) vers [Amazon ECR (Elastic Container Registry)](https://aws.amazon.com/ecr/), afin de les utiliser facilement dans vos projets cloud (Kubernetes, ECS, etc.).

---

## 🔧 Fonctionnalités

- ✅ Authentification automatique à ECR
- ✅ Téléchargement des images depuis Docker Hub
- ✅ Re-taggage et push vers vos dépôts ECR
- ✅ Migration de plusieurs images en une seule commande
- ✅ Compatible avec toutes les régions AWS

---

## ✅📋 Pré-requis

- [x] AWS CLI installé et configuré (`aws configure`)
- [x] Docker et Docker Desktop installés et fonctionnelles (`docker version`)
- [x] Un compte AWS avec les permissions ECR :
  - `ecr:CreateRepository`
  - `ecr:GetAuthorizationToken`
  - `ecr:PutImage`
- [x] Vos images Docker doivent être disponibles publiquement ou avec un compte Docker Hub

---

## 🔐 Exemple de Policy IAM à attacher

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:*"
      ],
      "Resource": "*"
    }
  ]
}
```
## 📝 Exemple d’utilisation


### 1. Cloner le repo

```bash
git clone https://github.com/Aladjimalicklo/dockerhub-to-ecr.git
```
### 2. Modifier les variables dans le script
  Ouvrez migrate-to-ecr.sh et modifiez :
  
  REGION : votre région AWS (ex: eu-west-1)
  
  DOCKERHUB_USER : votre nom Docker Hub
  
  APPS : les noms de vos images Docker

### 3. Lancer le script

```bash
chmod +x migrate-to-ecr.sh
./migrate-to-ecr.sh
```
---

---

## 📌 Astuces

- 🎯 Change `REGION` si tu veux utiliser une autre région AWS.
- 🖊️ Modifie `APPS=(...)` pour ajouter ou retirer des images à migrer.
- 🔐 Pour les images privées sur Docker Hub, tu dois d’abord t’y connecter avec `docker login`.

---

## 👨‍💻 Auteur

**ALADJI MALICK LO**  
🚀 **Junior DevOps & Cloud Engineer** en pleine ascension  
🎓 📚 **Spécialisation** :  
  - DevOps (Docker, Kubernetes, CI/CD)  
  - Cloud AWS  
  - Infrastructure as Code (Terraform)  
  - Automatisation 
 
🌍 Dakar, Sénégal  
🔗 [LinkedIn](http://linkedin.com/in/aladji-malick-lo-b1a048203)  
🐙 GitHub : [@Aladjimalicklo](https://github.com/Aladjimalicklo)

---



## 🙌 Contribuer

Les suggestions, issues ou pull requests sont les bienvenues.  
Si tu trouves ce script utile, ⭐ mets une étoile au dépôt !

---

Lien GitHub 👉 github.com/Aladjimalicklo/dockerhub-to-ecr
```

