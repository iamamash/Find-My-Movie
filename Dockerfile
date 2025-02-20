FROM python:3.8-slim-buster
WORKDIR app
COPY . /app
RUN pip3 install -r requirements.txt
ENV PORT 8000
CMD ["python3","app.py"]
