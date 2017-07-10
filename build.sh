rm -rf /root/.npm/*.lock.STALE
node -v
npm -v
npm install
bower --allow-root install

gulp dist

cd dist
zip -r ../email-notification-ui-0.0.1-SNAPSHOT.zip *
cd ..
