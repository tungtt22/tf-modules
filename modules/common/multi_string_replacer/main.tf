locals {
  rendered_value = join("\n", [
    for line in split("\n", var.input) :
    format(
      replace(line, "/{(${join("|", keys(var.map))})}/", "%s"),
      [
        for value in flatten(regexall("{(${join("|", keys(var.map))})}", line)) : var.map[value]
      ]...
    )
  ])
}
