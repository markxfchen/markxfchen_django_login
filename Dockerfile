# 使用官方 Python 基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 复制 requirements.txt 文件并安装依赖
COPY requirements.txt /app/

# 安装必要的系统依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    pkg-config python3-dev default-libmysqlclient-dev build-essential

RUN pip install --upgrade pip
RUN pip install -r requirements.txt --index https://pypi.tuna.tsinghua.edu.cn/simple/

# 复制项目文件
COPY . /app/

# 暴露端口
EXPOSE 8000

# 运行迁移命令
RUN #python manage.py migrate login_app

# 启动 Django 开发服务器
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
