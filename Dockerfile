# 1. Define a imagem base
FROM node:18-alpine

# 2. Define o diretório de trabalho
WORKDIR /usr/src/app

# 3. Instala o pnpm globalmente dentro do container
RUN npm install -g pnpm

# 4. Copia arquivos de dependência
COPY package.json pnpm-lock.yaml* ./

# 5. Instala as dependências usando pnpm
RUN pnpm install

# 6. Copia o restante do código
COPY . .

# 7. Expõe a porta
EXPOSE 3000

# 8. Comando de inicialização
CMD ["pnpm", "run", "dev"]