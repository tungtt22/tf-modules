# common/multi_string_replacer

Provider-agnostic utility module that replaces `{placeholder}` tokens in a string using values from a map.

## When To Use

Use this module when you need deterministic string rendering inside Terraform locals or other common modules.

## Usage

```hcl
module "replace" {
  source = "../../../modules/common/multi_string_replacer"

  input = "{team}-{environment}-{service}"
  map = {
    team        = "platform"
    environment = "dev"
    service     = "network"
  }
}
```

## Outputs

- `value`: rendered string after replacements
