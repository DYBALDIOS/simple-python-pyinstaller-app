FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends binutils && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY sources ./sources
COPY simple-python-pyinstaller-app.spec .

RUN python -m unittest discover -s sources -p "test_calc.py" -v

RUN python -m PyInstaller simple-python-pyinstaller-app.spec --clean

CMD ["./dist/simple-python-pyinstaller-app"]