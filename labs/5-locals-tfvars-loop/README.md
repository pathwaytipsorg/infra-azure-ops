## .tfvars

* To parameterize and customize your configuration across different modules, environments, or use cases.

Example:
```
terraform apply -var-file="dev.tfvars"
```

## locals

* To simplify computations, reduce redundancy, and improve the readability of your configuration within a single module.

## for_each
* To create multiple instances of a resource, module, or other construct based on a map or set of values. This allows you to dynamically generate resources based on the elements of the given collection. 
* The for_each argument is especially useful when you want to create and manage multiple similar resources with distinct attributes.