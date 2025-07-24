# Analysis of Algorithms in DPRAM Model

DPRAM := Distributed Parallel Random Access Machines

**[1 hour]** 

- Abstract Machine Models
  - SRAM: Sequential Random Access Machine Model (older computers)
  - PRAM: Parallel Random Access Machine Model (laptops and smarart phones) 
  - DPRAM: Distributed Parallel Random Access Machine Model (cluster of computers or cloud)
- Asymptotic Analysis of Algorithms under Work-Depth Model and Brent's Theorem
  - SRAM PRAM and DPRAM models with 1, 2, ..., p, p+1, ... processors and a memory model
  - Example + : Addition of n numbers in SRAM, PRAM and DPRAM models 
    - we will revisit this example implemented using ray.io in a memory model
  - Fastest Sorting Algorithm in DPRAM model = d distributed PRAM models 
- JAM: Jursidiction-Aware Models allows DPRAM to include enforceable contracts by a STATE
  - many clouds in a sky: "sky computing" means your service is agnostic to a set of clouds,    - Example: databricks.com offers sky computing acorss some clouds: AWS, GCP and Azure 
  - JAM-sky-State extends DPRAM by specifying the Nation State of the cloud-provider's HQ, i.e., the State that can enforce contracts and regulate each cloud in the sky.
  - Examples of JAM-sky-State, a set of cloud providers under the jurisdiction of a State:
    - JAM-sky-USA includes AWS, GCP, Azure, etc.
    - JAM-sky-China includes Alibaba, Tencent, Huawei, etc.
    - JAM-sky-EU includes scaleway, OVHcloud, Exoscale, Elastx, etc.
    - JAM-sky-Sverige includes Elastx, bahnhof, etc.
  - JAM-sky-State is the Law+Math model required for sovereign operations in the said State 
    - i.e., to enforce contracts or prohibit their violations or regulate possible contracts through coercive powers of the said State and not by another *State*.
