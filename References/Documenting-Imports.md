# Documenting Imports

The file must be added to the `Content/resources` folder and must be named *object_name-import.md*, for example *load_balancer-import.md*.  

## Template

````
## Import

A `<resource>` can be imported using `<import data>`. For example:

```console

$ terraform import outscale_<resource_name>.Imported<ResourceName> <import data>

```
````

## Example

````
## Import

A virtual gateway can be imported using its ID. For example:

```console

$ terraform import outscale_virtual_gateway.ImportedVirtualGateway vgw-12345678

````