# Utiliser l'image de base OpenJDK 17
FROM openjdk:17.0.2

# Copier le contenu local dans le répertoire de travail dans l'image
COPY . /usr/src/myapp

# Définir le répertoire de travail
WORKDIR /usr/src/myapp

# Assurez-vous que le fichier mvnw est exécutable
RUN chmod +x ./mvnw

# Exécuter la compilation du projet Maven
RUN ./mvnw clean package -X

# Utiliser la syntaxe JSON recommandée pour CMD afin d'éviter des problèmes de gestion de signaux
CMD ["./mvnw", "cargo:run", "-P", "tomcat90"]
