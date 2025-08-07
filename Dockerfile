# Etapa base: desenvolvimento
FROM node:20

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos de dependência
COPY package*.json ./

# Instala as dependências
RUN npm install

# Instala mysql2 para script de inicialização
RUN npm install mysql2

# Instala o Prisma CLI globalmente
RUN npm install -g prisma

# Copia o restante do código
COPY . .

# Expõe a porta do NestJS
EXPOSE 3000

# Comando padrão (modo dev)
CMD ["sh", "-c", "npx prisma generate && npm run start:dev"]