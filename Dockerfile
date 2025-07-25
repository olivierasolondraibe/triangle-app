# Utilise une image Java officielle
FROM openjdk:8-jdk-alpine

# Copie le jar construit par Maven dans l'image
COPY target/triangle-app-1.0-SNAPSHOT.jar /app.jar

# Commande de démarrage
ENTRYPOINT ["java", "-jar", "/app.jar"]
