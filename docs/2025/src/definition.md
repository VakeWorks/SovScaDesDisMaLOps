# Definition

## Definition of SovScaDesDisMaLOps  

* **SovScaDesDisMaLOps** := Sovereign Scalable Data Engineering Sciences and Distributed Machine Learning Operations

- **DesDisMaL** := **D**ata Engin**e**ering Science**s** and **Dis**tributed **Ma**chine **L**earning 
    - matematics + statistics + computing + micro-economics + domain-expertise
- **SovSca_Ops** := **Sov**ereign and **Sca**lable *(Business and Digital)* **Op**eration**s**
    - law + entrepreneurship + operations
    - sovereign = being independent and free from the control of another
    - scalable = being able to grown on demand

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
    MLOps [label="MLOps =  Machine Learning, DevOps,\n Data Engineering & Security"];

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

# Reference Books

![RefBooks](./images/REFbooks.jpeg)

See [LI post](https://www.linkedin.com/posts/raazesh-sainudiin_law-datascience-law-activity-7344402289090093057-Bz7i) for context.

