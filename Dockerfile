FROM ghcr.io/quarto-dev/quarto-full:1.4.553 AS build

COPY quarto /mysite
RUN quarto render /mysite --output-dir /usr/share/nginx/html

FROM nginx:latest

COPY --from=build /usr/share/nginx/html /usr/share/nginx/html
EXPOSE 80