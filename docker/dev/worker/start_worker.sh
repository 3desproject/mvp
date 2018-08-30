#!/bin/sh

celery worker -A mvp_worker -l INFO --events