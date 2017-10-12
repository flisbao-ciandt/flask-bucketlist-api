FROM python:2.7
ADD . /run
COPY . /run
WORKDIR /run
RUN pip install --force-reinstall -r requirements.txt
#ENV FLASK_CONFIG development
ENV FLASK_APP run.py
EXPOSE 80
RUN python manage.py db init
RUN python manage.py db migrate
RUN python manage.py db upgrade
#RUN apt-get update
#RUN apt-get -y install sqlite3 libsqlite3-dev apt-utils
#ENTRYPOINT [ "python","-m","flask","run","--host=0.0.0.0" ]
#RUN python run.py --host=0.0.0.0
CMD python server.py
