# pull official base image
FROM node:19-alpine AS builder
ENV NODE_ENV production

# install yarn
RUN npm install -g yarn --force

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY yarn.lock ./
RUN yarn install --production

# add app
COPY . ./

# build the project
RUN yarn build

# Bundle static assets with nginx
FROM nginx:1.23.3 as production
ENV NODE_ENV production

# Copy built assets from builder
COPY --from=builder /app/build /usr/share/nginx/html
# Add your nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Expose port
EXPOSE 80
# Start nginx
CMD ["nginx", "-g", "daemon off;"]