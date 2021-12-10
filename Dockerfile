FROM python:3.8.0-buster

#Make a directory of application
WORKDIR /codebase

#Install Dependencies
COPY requirements.txt . 
RUN pip install -r requirements.txt

#Copy SourceCode
COPY /DockerSource .
CMD ["python","Word2Vec/Word2Vec_Main.ipynb"]
CMD ["python","codebert notebooks/Generate_CodeBERT_embeddings.ipynb"]
CMD ["python","codebert notebooks/CodeSearch_w_CodeBERT.ipynb"]

