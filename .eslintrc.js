module.exports = {
  "extends": "airbnb-base",
  "rules": {
    // enable additional rules
    "quotes": ["error", "single"],
    "semi": [2, "never"],

    // override default options for rules from base configurations
    "comma-dangle": ["error", "never"],
    "no-cond-assign": ["error", "always"],

    "no-console": "off",
    "strict": 0
  },
  "env": {
    "browser": true,
    "node": true
  },
  "settings": {
    "import/resolver": {
      "node": {
        "extensions": [".js", ".ts"]
      }
    }
  }
}
