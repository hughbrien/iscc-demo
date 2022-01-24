FROM python:3

RUN useradd --create-home --shell /bin/bash app_user
RUN sudo apt install vim

WORKDIR /home/app_user

COPY requirements.txt ./
COPY demo.txt ./
COPY demo.jpg ./
COPY demo.heic ./
COPY generate_issc.py ./
RUN pip install iscc-core
RUN pip install iscc-cli

RUN pip install --no-cache-dir -r requirements.txt

USER app_user

# docker build -t iscc_demo --rm  .
# docker run -it --name iscc-client  -rm iscc_demo
# app_user@6a8e836b3f0c:~$ python my_script.py argument1 argument2
# Attempting to use iscc_demo

COPY . .

#CMD [ "python", "./generate_issc.py" ]
CMD ["bash"]

