# UPGRADE DOCKER
# Credits https://github.com/TeamKillerX/KillerX-Music/
# telegram https://t.me/FFmpegNotInstalled

FROM rendyprojects/killerx-music:latest
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get autoremove --purge
RUN pip3 install --upgrade pip setuptools 
RUN if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi 
RUN if [ ! -e /usr/bin/python ]; then ln -sf /usr/bin/python3 /usr/bin/python; fi 
RUN rm -r /root/.cache
RUN git clone -b dev https://github.com/https-github-com-mrarunDME/herokubam1
RUN mkdir /root/herokubam1/bin/
WORKDIR /root/herokubam1/
RUN chmod +x /usr/local/bin/*

# YNTKTS LMAO :) 
COPY . /app/
WORKDIR /app/
RUN chmod 777 /app/

# install requirements 
RUN python3 -m pip install -U -r https://github.com/https-github-com-mrarunDME/herokubam1/dev/requirements.txt
RUN python3 -m pip install --no-cache-dir -r https://raw.githubusercontent.com/mrarumrarunDMEnDME/herokubam1/dev/resources/startup/optional-requirements.txt

# final run 
CMD ["bash", "startup.sh"]
