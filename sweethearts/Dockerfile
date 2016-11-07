FROM python:3.5.2

ADD . /bot
WORKDIR /bot

RUN pip install -r requirements.txt

ENTRYPOINT ["./sweethearts.py"]
