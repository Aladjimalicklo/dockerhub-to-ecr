#!/bin/bash

# ✅ Définir la région AWS (doit correspondre à celle des dépôts ECR)
# votre region AWS, par exemple "us-east-1", "
REGION="votre région AWS (ex: eu-west-1)"

# ✅ Récupérer l'ID du compte AWS actuel (ex: 1234789012)
ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)

# ✅ Liste des images à migrer depuis Docker Hub vers ECR
# les noms des images doivent correspondre aux noms des images Docker
APPS=(" les noms de vos images Docker ex: image1 image2 image3")

# ✅ Nom d'utilisateur Docker Hub (adapté à tes images existantes)
DOCKERHUB_USER="votre-utilisateur-dockerhub"

# ✅ Connexion à Amazon ECR avec authentification Docker
aws ecr get-login-password --region $REGION \
  | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

# ✅ Boucle sur chaque application
for APP in "${APPS[@]}"; do
    echo "🚀 Migration de l'image $APP..."

    # 🔽 Télécharger l'image depuis Docker Hub
    docker pull $DOCKERHUB_USER/$APP:latest

    # 🏷️ Re-tagger l'image avec le registre ECR
    docker tag $DOCKERHUB_USER/$APP:latest \
      $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$APP:latest

    # ⬆️ Pousser l'image vers le dépôt ECR
    docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$APP:latest

    echo "✅ $APP migrée avec succès."
done

echo "🎉 Migration terminée pour toutes les images Docker."
