desktop Cookbook
=====================================

This cookbook helps with initial installation of new desktop machine. It's
a collection of tools I use and I don't think it's helpful to anybody else.

Attributes
----------

#### desktop::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['desktop']</tt></td>
    <td>Hash</td>
    <td>container of all desktop apps adjusting settings.</td>
  </tr>
  <tr>
    <td><tt>['synergy']</tt></td>
    <td>Hash</td>
    <td>Synergy configuration.</td>
  </tr>
</table>

Usage
-----
#### desktop::default

Just include `desktop` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[desktop]"
  ]
}
```

See default attributes for customization options
