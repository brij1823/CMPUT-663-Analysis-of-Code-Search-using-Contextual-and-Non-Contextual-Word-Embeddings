# CMPUT-663-Analysis-of-Code-Search-using-Contextual-and-Non-Contextual-Word-Embeddings

Millions of repetitive code snippets are submitted to code repositories every day. To search from these large codebases using simple natural language queries would allow programmers to prototype faster. This ability to search the code using natural language is called Code Search. Recent works in this area have majorly focused on analysing the quality of the code embedding models. In this work, we also analyse the efficiency  of these embedding models by comparing a contextual and non contextual word embeddings on which the code embedding models are formed. 

## Table of Contents
* [Installation and Results Replication](#Installation)
    * [InstallationSteps](#InstallationSteps) 
    * [Replication](#Replication)
* [Dataset](#Dataset)
* [Experiments](#Experiments)


## Installation and Results Replication

### InstallationSteps
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

### Replication
To replicate results of CodeBERT:
1) Either generate embeddings or skip to step 4 and use the embeddings we generated.
2) To generate embeddings yourself, go to 'codebert notebooks' folder and run 'Generate_CodeBERT_embeddings.ipynb'.
3) Change the path of CodeSearchNet data according to your environment and follow the Generate_CodeBERT_embeddings.ipynb file to generate embeddings. Tensors of size 100 are generated and saved to the drive ( change this location to the location you want to store your tensors). These 100 length tensors are then read and saved as a one big tensor of all the embeddings of the dataset. This concatenated tensor will be used to implement code search. Generation of embeddings for 20,000 training examples takes around 5 hours.
4) Use the embeddings given in folder 'CodeBERT_embeddings' and update the embedding paths in the 'CodeSearch_w_CodeBERT.ipynb' present in 'codebert notebooks' folder.
5) For training code embeddings use 'CodeBERT_embeddings/train_embeddings/code_embds_20000.pt', for training docstring embeddings use 'CodeBERT_embeddings/train_embeddings/doc_embds_20000.pt'. Similary, in testing, use 'doc_embds_2000.pt' and 'code_embds_2000.pt'. For embeddings used in Experiment 3, use 'CodeBERT_embeddings/train_embeddings/code_doc_main.pt'
6) Run the CodeSearch_w_CodeBERT.ipynb file without changing any other variable to replicate the results of Experiment 2 with 15000 training data
7) To replicate results of Experiment 1 and other settings of Experiment 2, follow the instructions in CodeSearch_w_CodeBERT.ipynb and change the variables according to the experiment.
## Dataset
Here is the [link](https://github.com/github/CodeSearchNet) to official CodeSearchNET github repository.

The primary dataset consists of 2 million (comment, code) pairs from open source libraries. Concretely, a comment is a top-level function or method comment (e.g. [docstrings](https://en.wikipedia.org/wiki/Docstring) in Python), and code is an entire function or method. Currently, the dataset contains Python, Javascript, Ruby, Go, Java, and PHP code. Throughout this repo, we refer to the terms docstring and query interchangeably. We partition the data into train, validation, and test splits such that code from the same repository can only exist in one partition. Currently this is the only dataset on which we train our model. Summary statistics about this dataset can be found in this [notebook](https://github.com/github/CodeSearchNet/blob/master/notebooks/ExploreData.ipynb).
For more information about how to obtain the data, see this [section](https://github.com/github/CodeSearchNet#data-details).

Here is the dataframe snapshot of python filtered dataset of CodeSearchNET.

![alt Dataframe Snapshot](https://github.com/brij1823/CMPUT-663-Analysis-of-Code-Search-using-Contextual-and-Non-Contextual-Word-Embeddings/blob/main/images/codesearchnet.png)


## Experiments

### Experiment 1:
To run the results conducted in experiment 1 for Word2Vec, run the following notebook
```
python Word2Vec/Experiment1_10_word2vec.ipynb
python Word2Vec/Experiment1_10_15_word2vec.ipynb
python Word2Vec/Experiment1_20_word2vec.ipynb
```

### Experiment 2:
To run the results conducted in experiment 2 for Word2Vec, run the following notebook
```
python Word2Vec/Word2Vec_Main.ipynb
python Word2Vec/Experiment2_10k_word2vec.ipynb
python Word2Vec/Experiment2_15k_word2vec.ipynb
```

### Experiment 3:
To run the results conducted in experiment 3 for Word2Vec, run the following notebook
```
python Word2Vec/Experiment3_word2vec.ipynb
```




