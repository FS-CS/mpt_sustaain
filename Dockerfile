FROM downloads.unstructured.io/unstructured-io/unstructured AS builder

SHELL ["/bin/bash", "-c"]

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONBUFFERED=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
WORKDIR /home/notebook-user

COPY extra_requirements.txt openai_api_key.txt override_sqlite3.py ./
RUN pip install --no-cache-dir -r extra_requirements.txt
USER root
RUN python3.10 override_sqlite3.py

SHELL ["/bin/bash", "-c"]
EXPOSE 8000

FROM builder AS build1

ADD data data
ADD notebooks notebooks
CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--port","8000", "--no-browser", "--allow-root"]