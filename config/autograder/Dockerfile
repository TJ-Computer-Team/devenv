FROM node:20

WORKDIR /home/tjctgrader/autograder

COPY ./package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "devStart"]
