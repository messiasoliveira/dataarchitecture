#!/bin/sh
echo "Start: Sleep 15 seconds"
sleep 30;
wait;
echo "Creating environments"
docker exec jupyter_notebook cd /home/jovyan/work/ml
docker exec jupyter_notebook python -m venv ml
docker exec jupyter_notebook source ml/bin/activate
docker exec jupyter_notebook pip install -r requirements.txt
docker exec jupyter_notebook ipykernel install --user --name=projeto_ml
docker exec jupyter_notebook desactivate
docker exec jupyter_notebook cd /home/jovyan/work/scraping
docker exec jupyter_notebook python -m venv projeto_scraping
docker exec jupyter_notebook source projeto_scraping/bin/activate
docker exec jupyter_notebook pip install -r requirements.txt
docker exec jupyter_notebook ipykernel install --user --name=projeto_scraping
docker exec jupyter_notebook desactivate