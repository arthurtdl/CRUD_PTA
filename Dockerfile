# 1. Imagem Base
FROM node:18-alpine

# 2. Diretório de Trabalho
WORKDIR /usr/src/app

# 3. Instala o pnpm
RUN npm install -g pnpm

# 4. Cache de Dependências
# Copia apenas os arquivos de manifesto primeiro para aproveitar o cache do Docker
COPY package.json pnpm-lock.yaml* ./

# 5. Instala as dependências
RUN pnpm install

# 6. Copia o código fonte
COPY . .

# 7. Expõe a porta 3001 (Importante: tem que bater com o server.ts)
EXPOSE 3001

# 8. Comando de inicialização
CMD ["pnpm", "run", "dev"]