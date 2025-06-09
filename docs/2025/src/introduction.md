![VakeWorks logo](images/VakeWorksTM_white_284.png)
<!-- <img src="images/VakeWorksTM_284.png" alt="VakeWorks logo"> -->

# Introduction

* **SovScaDesDisMaLOps** := Sovereign Scalable Data Engineering Sciences and Distributed Machine Learning Operations


## THM: Theoretical Modules -- Overview

1. Data Engineering Sciences and Distributed Machine Learning Now 
2. Laws of Capitalism, Statistical Contract Theory, Intellectual Property Laws in Sweden, Corporate Jurisdictions and Sovereignty  
3. Abstract Machine Models, Work-Depth Model, Brent's Theorem, and Analysis of the Fastest Sorting Algorithm in Distributed Parallel Random Access Machine (DPRAM) model

## PRM: Practical Modules -- Overview

1. Scaling Python with Ray in a Hurry (requirements: git or github account; docker desktop; up-to-date and secure laptop)
2. Deploying for Sovereign Operations in Scalable Data Engineering Sciences and Distributed Machine Learning Spaces.


## THM.1 Data Engineering Sciences and Distributed Machine Learning Now

Data Engineering Sciences and Distributed Machine Learning today is 
matematics + statistics + computing + micro-economics ++ domain-expertise and entrepreneurship

## SovScaDesDisMaLOps 

**SovScaDesDisMaLOps** := Sovereign Scalable Data Engineering Sciences and Distributed Machine Learning Operations

```dot process
digraph {
    layout="circo";
    size ="7,7";
    ranksep = 3;
    nodesep = 4;
    node [shape=record, width=0.3, fillcolor=green3, style=filled];
    Des [label="Data Engineering Sciences"];
    DisML [label="Distributed Machine Learning"];
    MLOps [label="MLOps =  Machine Learning,\n DevOps and Data Engineering"];

    node [shape=record, fillcolor=lightblue, style=filled];
    LawSov [label="Laws of Capitalism,\n Contracts, IP,\n Jurisdiction, Sovereignty"];
    ConThe  [label="microeconomics\n statistical contract theory"];
    
    node [shape=record, fillcolor=lightgray, style=filled];
    MATHS [label="Mathematics"];
    STATS [label="Statistics"];
    COMPT [label="Computing and \n Software Engineering"];
    DOMEX  [label="Domain Expertise\n (in Science, Engineering, Art, Humanities, etc.)"];

    node [shape=record, fillcolor=gray, style=filled];
    Entrp [label="Entrepreneurship"];

    node [shape=record, fillcolor=darkgray, style=filled];
    SovScaDesDisMaLOps [label="Sovereign Scalable \n Data Engineering Sciences and\n Distributed Machine Learning Operations"];
    
    ConThe -> LawSov;
    LawSov -> Entrp;
    MATHS -> Des;
    STATS -> Des;
    COMPT -> Des;
    DOMEX -> Des;
    ConThe -> Des;
    DisML -> Des; 
    MLOps -> Des; 
    Des -> SovScaDesDisMaLOps; 
    MLOps -> SovScaDesDisMaLOps; 
    LawSov -> SovScaDesDisMaLOps; 
    Entrp -> SovScaDesDisMaLOps; 
}
```
