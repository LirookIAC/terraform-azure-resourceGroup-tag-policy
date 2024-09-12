{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Resources/subscriptions/resourceGroups"
      },
      {
        "not": {
          "allOf": ${tag_checks}
        }
      }
    ]
  },
  "then": {
    "effect": "${effect}"
  }
}