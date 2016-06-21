FROM node

# a hack to fix: EXDEV: cross-device link not permitted, rename
RUN cd $(npm root -g)/npm \
&& npm install fs-extra \
&& sed -i -e s/graceful-fs/fs-extra/ -e s/fs.rename/fs.move/ ./lib/utils/rename.js

RUN mkdir -p /opt/app
ADD . /opt/app
WORKDIR /opt/app

RUN npm install

CMD ["node", "start.js"]

EXPOSE 5999
