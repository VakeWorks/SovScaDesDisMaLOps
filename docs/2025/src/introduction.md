![VakeWorks logo](images/VakeWorksTM_white_284.png)
<!-- <img src="images/VakeWorksTM_284.png" alt="VakeWorks logo"> -->

# Introduction

## Definition of SovScaDesDisMaLOps  

* **SovScaDesDisMaLOps** := Sovereign Scalable Data Engineering Sciences and Distributed Machine Learning Operations

- Data Engineering Sciences and Distributed Machine Learning =
    - matematics + statistics + computing 
    - micro-economics 
    - domain-expertise
- Sovereignty and Scalability =
    - law  
    - entrepreneurship

## SovScaDesDisMaLOps 

```dot process
digraph {
    layout="circo";
    label="\n\nSovScaDesDisMaLOps := Sovereign Scalable Data Engineering Sciences and Distributed Machine Learning Operations"
    fontsize="40"
    size ="8,8";
    graph [bgcolor=lightgray, fontsize=40]
    node [fontsize=40]
    edge [fontsize=40]
    ranksep = 4;
    nodesep = 3;
    node [shape=record, fillcolor=green1, style=filled];
    Des [label="Data Engineering Sciences"];
    node [shape=record, fillcolor=green3, style=filled];
    DisML [label="Distributed \nMachine Learning"];
    MLOps [label="MLOps =  Machine Learning,\n DevOps and Data Engineering"];

    node [shape=record, fillcolor=lightblue, style=filled];
    LawSov [label="Laws of Capitalism,\n Contracts, IP,\n Jurisdiction, Sovereignty"];
    ConThe  [label="microeconomics\n statistical contract theory"];
    
    node [shape=record, fillcolor=lightgreen, style=filled];
    MATHS [label="Mathematics"];
    STATS [label="Statistics"];
    COMPT [label="Computing and \n Software Engineering"];
    node [shape=record, fillcolor=cyan, style=filled];
    DOMEX  [label="Domain Expertise\n (in Science, Engineering, Art, Humanities, etc.)"];

    node [shape=record, fillcolor=lightblue, style=filled];
    Entrp [label="Entrepreneurship,\nBusiness Scalability"];

    node [shape=record, fillcolor=gold, style=filled];
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

## THM: Theoretical Modules -- Overview

1. Laws of Capitalism, Statistical Contract Theory, Intellectual Property Laws in Sweden, Corporate Jurisdictions and Sovereignty  
2. Abstract Machine Models, Work-Depth Model, Brent's Theorem, and Analysis of the Fastest Sorting Algorithm in Distributed Parallel Random Access Machine (DPRAM) model

## PRM: Practical Modules -- Overview

1. Scaling Python with Ray in a Hurry (requirements: git or github account; docker desktop; up-to-date and secure laptop)
2. Deploying for Sovereign Operations in Scalable Data Engineering Sciences and Distributed Machine Learning Spaces.


