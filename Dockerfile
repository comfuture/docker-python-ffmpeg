FROM python:stretch

ADD . /app

# prepare ffmpeg static build binary
ADD https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz /tmp
RUN tar -C/tmp --strip=1 -xf /tmp/ffmpeg-git-amd64-static.tar.xz && \
    cp /tmp/ffmpeg /bin && chmod 755 /bin/ffmpeg

ENTRYPOINT [ "ffmpeg" ]
CMD [ "--help" ]

