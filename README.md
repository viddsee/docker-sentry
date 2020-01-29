### Image Variants

Format: `viddsee/sentry:<image-version>-<sentry-version>`<br>
Example: `viddsee/sentry:0.0.1-9.1.1`

### Development

*Note* Make sure if you have done `docker login` and has the right access to viddsee docker repository

#### Publishing

##### Default
```sh
cd images/0.0.1/9.1.1
docker build -t viddsee/sentry:0.0.1-9.1.1 .
docker push viddsee/sentry:0.0.1-9.1.1
```
