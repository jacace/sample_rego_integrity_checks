# sample_rego_integrity_checks
This repo has two objectives as follows:

1) It showcases Rego language. For this purpose there is also a companion documentation in my blog @ https://jacace.medium.com/rego-tutorial-6e6440052905
To run the RuleSets just use the following command:
./opa eval --fail-defined -i input.json -d example.rego "data.example.violation[x]" echo $?

2) It shows how to perform the same integrity checks in BasicDataQualityExample.scala but using rego.
These integrity checks (with scope at DataItem, not DataSet) are for Data Quality and don't cover distribution.

Happy coding!

Javier Caceres
