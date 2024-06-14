FROM ghcr.io/quarto-dev/quarto-full:1.5.45 AS build

COPY quarto /mysite

RUN apt-get update && apt-get upgrade -y
RUN quarto render /mysite --output-dir /output

FROM nginx:latest

COPY --from=build /output /usr/share/nginx/html
EXPOSE 80