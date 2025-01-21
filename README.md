# terraformPlayback


Defining resource dependencies with depends_on

Managing conditional resources (e.g., count and for_each expressions) 

Running Terraform operations in parallel vs sequential execution

<img width="500" alt="image" src="https://github.com/user-attachments/assets/8301f5a3-480f-4344-aa57-8fbce9f4cebb" />

The terraform apply -parallelism=1 command is used to limit the number of concurrent operations Terraform performs when applying a configuration. By default, Terraform performs multiple operations in parallel to speed up the process. However, setting -parallelism=1 forces Terraform to apply changes one at a time, sequentially.The default parallelism value is usually sufficient for most use cases. Terraform's default is typically set to 10 concurrent operations


<img width="909" alt="image" src="https://github.com/user-attachments/assets/ede1611b-efd0-471a-b3d1-cc494b8f89b9" />


<img width="924" alt="image" src="https://github.com/user-attachments/assets/dcf2db3e-022a-4d90-baed-f3a4c460a853" />


