# Uporabite osnovni RASA image
FROM rasa/rasa:latest-full

# Nastavite delovno mapo v kontejnerju
WORKDIR /app

# Kopirajte RASA projekt v kontejner
COPY . /app

# Dodajte entrypoint.sh
COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

# Ukaz za zagon RASA strežnika
CMD ["rasa", "run", "--enable-api", "--cors", "*"]
