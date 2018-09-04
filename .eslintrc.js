module.exports = {
  "extends": ["airbnb-base", "prettier", "plugin:react/recommended"],
  "parser": "babel-eslint",
  "rules": {
    "class-methods-use-this": [2, {"exceptMethods": ["render"]}],
    "no-console": "off",
    "no-new": "off",
    "react/prop-types": "off"
  },
  "env": {
     "browser": true,
     "node": true
  }
}
