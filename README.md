# CMPUT-663-Analysis-of-Code-Search-using-Contextual-and-Non-Contextual-Word-Embeddings

Millions of repetitive code snippets are submitted to code repositories every day. To search from these large codebases using simple natural language queries would allow programmers to prototype faster. This ability to search the code using natural language is called Code Search. Recent works in this area have majorly focused on analysing the quality of the code embedding models. In this work, we also analyse the efficiency  of these embedding models by comparing a contextual and non contextual word embeddings on which the code embedding models are formed. 

## Table of Contents
* [Installation and Results Replication](#Installation)
* [Dataset](#Dataset)


## Installation and Results Replication

1. To install all the necessary python tools and packages, redirect to the folder containing requirements.txt
```
pip install requirements.txt
```
2. Downloading the CodeSearchNet dataset, we have provided the dataset we have used in python folder, but to clone the latest repository please run the following command in CLI
```
#Downloading the dataset

wget https://s3.amazonaws.com/code-search-net/CodeSearchNet/v2/python.zip
unzip python.zip

```
3. Execute Word2Vec Jupyter python notebook
```
# The notebooks of Word2Vec and CodeBERT must be run by making necessary changes for different experiments.
python Word2Vec/Word2Vec_Main.ipynb
```
4. Execute CodeBERT Jupyter python notebook
```

# First run the Generate_CodeBERT_embeddings.ipynb to generate the embeddings from CodeBERT
python codebert notebooks/Generate_CodeBERT_embeddings.ipynb 

# Then run CodeSearch_w_CodeBERT.ipynb to run the experiments for Code Search and get results 
python codebert notebooks/CodeSearch_w_CodeBERT.ipynb
```

## Dataset
Here is the [link](https://github.com/github/CodeSearchNet) to official CodeSearchNET github repository.

The primary dataset consists of 2 million (comment, code) pairs from open source libraries. Concretely, a comment is a top-level function or method comment (e.g. [docstrings](https://en.wikipedia.org/wiki/Docstring) in Python), and code is an entire function or method. Currently, the dataset contains Python, Javascript, Ruby, Go, Java, and PHP code. Throughout this repo, we refer to the terms docstring and query interchangeably. We partition the data into train, validation, and test splits such that code from the same repository can only exist in one partition. Currently this is the only dataset on which we train our model. Summary statistics about this dataset can be found in this [notebook](https://github.com/github/CodeSearchNet/blob/master/notebooks/ExploreData.ipynb).
For more information about how to obtain the data, see this [section](https://github.com/github/CodeSearchNet#data-details).

Here is the dataframe snapshot of python filtered dataset of CodeSearchNET.

![alt Dataframe Snapshot](https://github.com/brij1823/CMPUT-663-Analysis-of-Code-Search-using-Contextual-and-Non-Contextual-Word-Embeddings/blob/main/images/codesearchnet.png)
