FROM node:14

RUN apt-get update && apt-get install -y \
    libreoffice

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 3000

CMD ["node", "src/index.mjs"]

