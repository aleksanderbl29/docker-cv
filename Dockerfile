FROM ghcr.io/quarto-dev/quarto:1.3.340 AS build

COPY quarto /mysite
RUN apt-get update && apt-get upgrade -y
RUN quarto render /mysite --output-dir /usr/share/nginx/html

FROM nginx:latest

COPY --from=build /usr/share/nginx/html /usr/share/nginx/html
EXPOSE 80