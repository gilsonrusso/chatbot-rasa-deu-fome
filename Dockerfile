# Use a imagem oficial do Python como base
FROM python:3.9-slim

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo de requisitos para o contêiner
COPY requirements.txt .

# Instale as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante do código da aplicação para o contêiner
COPY . .

# Exponha a porta em que a aplicação irá rodar
EXPOSE 5005

# Comando para rodar o Rasa
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--debug"]
