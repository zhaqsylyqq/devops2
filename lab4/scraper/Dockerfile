FROM alpine:3.19
RUN apk add --no-cache curl
COPY scraper.sh /scraper.sh
RUN chmod +x /scraper.sh
CMD ["/scraper.sh"]
