# as will refer this as the builder phase
FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# ↓ this will be automatically start new phase
FROM nginx
# copy something from builder phase
COPY --from=builder /app/build /usr/share/nginx/html 
