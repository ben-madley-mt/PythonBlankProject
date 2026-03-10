FROM python:3.13-slim

## Install system dependencies for Pillow
#RUN apt-get update && apt-get install -y \
#    libjpeg-dev \
#    zlib1g-dev \
#    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Poetry
RUN pip install poetry==2.3.2

# Copy dependency files
COPY pyproject.toml poetry.lock* ./

# Configure Poetry to not create virtual environments (we're in a container)
#RUN poetry config virtualenvs.create false

# Install Python dependencies
RUN poetry install --no-interaction --no-ansi --no-root

# Copy application code
COPY . .

# Default command runs the Flask app
CMD ["poetry", "run", "pytest"]