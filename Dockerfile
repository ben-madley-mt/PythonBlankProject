FROM python:3.13-slim

WORKDIR /app

# Install Poetry
RUN pip install poetry==2.3.2

# Copy dependency files
COPY pyproject.toml poetry.lock* ./

# Install Python dependencies
RUN poetry install --no-interaction --no-ansi --no-root

# Copy application code
COPY . .

# Default command runs the Flask app
CMD ["poetry", "run", "pytest"]