# Analysis of Algorithms & Operations

**DPRAMJAM := Distributed Parallel Random Access Machine Jurisdiction-Aware Model**

**[1 hour]** 

- **Abstract Machine Model (AMM)**
  - SRAM: Sequential Random Access Machine Model (older computers)
  - PRAM: Parallel Random Access Machine Model (laptops and smarart phones) 
  - DPRAM: Distributed Parallel Random Access Machine Model (cluster of computers or cloud)
- *Asymptotic analysis of efficiency of algorithms* under different AMMs
  - SRAM PRAM and DPRAM models with 1, 2, ..., p, p+1, ... processors and a memory model
  - Work-Depth Model and Brent's Theorem
  - Example + : Addition of n numbers in SRAM, PRAM and DPRAM models 
    - we will revisit this example implemented using ray.io in a memory model
  - Fastest Sorting Algorithm in DPRAM model = d distributed PRAM models 
- *Legal analysis of sovereignty of operations* under **Jurisdiction-Aware Model (JAM)** extend AMMs beyond *analysis of algorithms*
  - JAM-local-Sverige is our default model when we work in Sweden (Sverige) with sovereign infrasturcture in Sweden
    - Example: own laptops (default for this workshop), workstations, or own on-premise clouds (NuC cluster) under sovereignty of Sverige
  - many clouds in a sky: "sky computing" means your service is agnostic to a set of clouds    - Example: [databricks](https://databricks.com) offers sky computing across some clouds: AWS, GCP and Azure 
  - JAM-sky-State extends DPRAM by specifying the Nation State of the cloud-provider's HQ, i.e., the State that can enforce contracts and regulate each cloud in the sky.
  - Examples of JAM-sky-State, a set of cloud providers under the jurisdiction of a State:
    - JAM-sky-USA includes AWS, GCP, Azure, etc.
    - JAM-sky-China includes Alibaba, Tencent, Huawei, etc.
    - JAM-sky-EU includes scaleway, OVHcloud, Exoscale, Elastx, etc.
    - JAM-sky-Sverige includes Elastx, bahnhof, etc.
  - **DPRAMJAM-sky-State** = Distributed Parallel Random Access Machine Jurisdiction-Aware Model is the "Math+Law" model required for sovereign operations in the sky of a said State 
    - i.e., to enforce contracts or prohibit their violations or regulate possible contracts through coercive powers of the said State and not by another *State*.
