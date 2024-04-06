FROM nginx:latest AS build
COPY quarto /mysite
RUN apt-get update \
  && apt-get -y install wget ca-certificates \
  # && wget "https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.38/quarto-1.0.38-linux-arm64.deb" -O quarto.deb \
  && wget "https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.38/quarto-1.0.38-linux-arm64.deb" -O quarto.deb \
  && dpkg -i quarto.deb
RUN quarto render /mysite --output-dir /usr/share/nginx/html
FROM nginx:latest
COPY --from=build /usr/share/nginx/html /usr/share/nginx/html
EXPOSE 80