FROM python:3.11.12-slim-bookworm
WORKDIR /home/project/code

# 安装依赖，libmysqlclient-dev 替换为 libmariadb-dev，端口设置为 8080
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libssl-dev libffi-dev python3-dev pkg-config libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

COPY . .

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8080"]
