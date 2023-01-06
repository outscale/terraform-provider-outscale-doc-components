# Adapting Parameters in the Documentation of the OUTSCALE Terraform Provider

To adapt parameters extracted from the documentation of the OUTSCALE API to the documentation of the OUTSCALE Terraform provider, you need to create an additional properties file.  
The file must be added to either the `Content/data-sources` or `Content/resources` folder and be named *object_name-addprop.yaml*, for example *load_balancer_attributes-addprop.yaml*.  
**Note**: The file extension must be *.yaml*. The shorter version *.yml* is not taken into account.  

You must specify whether you want to adapt request or response parameters by organizing them under `argument` and `attribute` sections respectively, as follows:  
```yaml
argument:
  add:
    parameter data
  remove:
    parameter data
attribute:
  rename:
    parameter data
```

To refer to parameters, use snake_case format.  
To refer to a subparameter, specify its parent parameters from the highest to the lowest level separated by periods (`.`): `parent_parameter.subparameter.subsubparameter`.

The structure of the file is important and must respect the different spacing, indentation, and formatting.


## Add a Parameter Specific to Terraform

**Note**: You must specify whether the parameter is `Required` or `Optional` in the description.

```yaml
  add:
    tags: (Optional) A tag to add to this resource. You can specify this argument several times.
    tags.key: (Required) The key of the tag, with a minimum of 1 character.
    tags.value: (Required) The value of the tag, between 0 and 255 characters.
```
## Rename a Parameter

```yaml
  rename:
    security_groups: security_group_names
```


## Adapt the Description of a Parameter

```yaml
  rename:
    performance:
      description: The performance of the VM (`medium` | `high` | `highest`). Updating this parameter will trigger a stop/start of the VM.
```

## Rename a Parameter and Adapt its Description

**Note**: If your description ends with a colon (`:`), you must surround the description with quotation marks (`""`) to make sure it is interpreted literally.

```yaml
  rename:
    filters:
      name: filter
      description: "(Optional) A combination of a filter name and one or more filter values. You can specify this argument for as many filter names as you need. The filter name can be any of the following:"
```
## Remove a Parameter

**Note**: You must add a dash (`-`) in front of each removed parameter.  
**Tip**: You can add comments using a hash symbol (`#`).

```yaml
  remove:
    - max_vms_count
    - filters.tags
    - filter.is_default # Waiting for Terraform implementation
```

## Deal with Special Characters

To literally display characters used as part of the Markdown format such as dashes (`-`), you need to escape them using a backslash (`\`).

```yaml
  rename:
    iops:
      description: The number of I/O operations per second (IOPS):<br /> \- For `io1` volumes, the number of provisioned IOPS.<br /> \- For `gp2` volumes, the baseline performance of the volume.
```

If your description is surrounded by quotation marks (`""`), you need to double escape those characters using two backslashes (`\\`).

```yaml
  rename:
    iops:
      description: "The number of I/O operations per second (IOPS):<br /> \\- For `io1` volumes, the number of provisioned IOPS.<br /> \\- For `gp2` volumes, the baseline performance of the volume."
```

### List of Characters to Escape

* **\\** backslash itself
* **\`** backtick
* **\*** asterisk
* **\_** underscore
* **\{ \}** curly braces
* **\[ \]** square brackets
* **\( \)** parentheses
* **\#** hash symbol
* **\+** plus sign
* **\-** hyphen
* **\.** dot
* **\!** exclamation mark

## Deal with Multiline Descriptions

For multiline descriptions, add all sentences on the same line and use `<br />` tags to add line breaks.

```yaml
  add:
    admin_password: (Windows VM only) The administrator password of the VM. This password is encrypted with the keypair you specified when launching the VM and encoded in Base64. You need to wait about 10 minutes after launching the VM to be able to retrieve this password.<br />If `get_admin_password` is false or not specified, the VM resource is created without the `admin_password` attribute. Once `admin_password` is available, it will appear in the Terraform state after the next **refresh** or **apply** command.<br />If `get_admin_password` is true, the VM resource itself is not considered created until the `admin_password` attribute is available.<br />Note also that after the first reboot of the VM, this attribute can no longer be retrieved. For more information on how to use this password to connect to the VM, see [Accessing a Windows Instance](https://docs.outscale.com/en/userguide/Accessing-a-Windows-Instance.html).
```
## Refer to Subparameters

To refer to a subparameter, you need to mention its parent parameters' names, separated by periods (`.`). In the case of attributes of plural data sources, you must add the object name at the first level: `object_name.parameter.subparameter`.

```yaml
attribute:
  remove:
    - access_keys.expiration_date
    - vms.nics.account_id
```
