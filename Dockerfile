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
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt install -y ./google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb
RUN wget https://chromedriver.storage.googleapis.com/88.0.4324.96/chromedriver_linux64.zip && unzip chromedriver_linux64.zip && chmod +x chromedriver && mv -f chromedriver /usr/bin/ && rm chromedriver_linux64.zip
RUN git clone -b dev https://github.com/TeamKillerX/KillerX-Music /root/TeamKillerX
RUN mkdir /root/TeamKillerX/bin/
WORKDIR /root/TeamKillerX/
RUN chmod +x /usr/local/bin/*

# YNTKTS LMAO :) 
COPY . /app/
WORKDIR /app/
RUN chmod 777 /app/

# install requirements 
RUN python3 -m pip install -U -r https://raw.githubusercontent.com/TeamKillerX/KillerX-Music/dev/requirements.txt
RUN python3 -m pip install --no-cache-dir -r https://raw.githubusercontent.com/TeamKillerX/KillerX-Music/dev/resources/startup/optional-requirements.txt

# final run 
CMD ["bash","./resources/startup.sh"]
