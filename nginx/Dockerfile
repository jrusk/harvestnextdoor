FROM nginx:1.13.8
MAINTAINER Jonathan Rusk <jrusk@chromis.com>

# Delete default static pages.
RUN rm /usr/share/nginx/html/*

# Copy over the custom nginx and default configs.
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Start nginx in the foreground.
CMD ["nginx", "-g", "daemon off;"]
