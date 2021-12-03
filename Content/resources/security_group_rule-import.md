## Import

A security group rule can be imported using the following format: `SecurityGroupId_Flow_IpProtocol_FromPortRange_ToPortRange_IpRange`.

For example:

```console

$ terraform import outscale_security_group_rule.ImportedRule sg-87654321_outbound_-1_-1_-1_10.0.0.0/16

```
~> **Note:** You can specify only one IP range at a time. To import a rule with several IP ranges, you need to have as many imports as there are IP ranges.