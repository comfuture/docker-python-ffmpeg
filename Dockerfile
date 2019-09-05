FROM python:stretch

# extract prebuilt ffmpeg and ffprobe static build binary
ADD https://github.com/vot/ffbinaries-prebuilt/releases/download/v4.2/ffmpeg-4.2-linux-64.zip /tmp
RUN unzip /tmp/ffmpeg-4.2-linux-64.zip -d /tmp && \
    cp /tmp/ffmpeg /bin && chmod 755 /bin/ffmpeg

ADD https://github.com/vot/ffbinaries-prebuilt/releases/download/v4.2/ffprobe-4.2-linux-64.zip /tmp
RUN unzip /tmp/ffprobe-4.2-linux-64.zip -d /tmp && \
    cp /tmp/ffprobe /bin && chmod 755 /bin/ffprobe

RUN rm -f /tmp/*.zip

ENTRYPOINT [ "ffmpeg" ]
CMD [ "--help" ]

