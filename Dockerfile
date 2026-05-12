FROM python:3.12-bookworm

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Instalacja Playwright browserów
RUN python -m playwright install --with-deps chromium

COPY . .

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000", "--workers=1"]
