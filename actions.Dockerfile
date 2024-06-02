# Uporabite osnovni Python image
FROM rasa/rasa-sdk:latest

# Nastavite delovno mapo v kontejnerju
WORKDIR /app

# Kopirajte akcijske datoteke v kontejner
COPY . /app

# Copy the entrypoint.sh file
COPY entrypoint.sh /app/entrypoint.sh


# Ukaz za zagon akcijskega strežnika
CMD ["/app/entrypoint.sh", "start", "--actions", "actions"]