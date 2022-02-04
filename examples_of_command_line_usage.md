## Compile the app
`cd hamnn`

`v -gc boehm .`

## Getting help
`./vhamnn --help` or
`./vhamnn -h` or simply, 
`./vhamnn`

For individual commands, use this pattern:

`./vhamnn analyze --help` or `./vhamnn analyze -h` or `./vhamnn analyze`

## Analyzing a dataset
`./vhamnn analyze datasets/anneal.tab`

## Discovering which attributes are most useful
`./vhamnn rank --show --graph datasets/anneal.tab` or

`./vhamnn rank -s -g datasets/anneal.tab`

To specify a range for the number of bins for continuous attributes (if unspecified, the default range is 2 through 16 inclusive):

`./vhamnn rank --show --bins 3,6 datasets/iris.tab` or 

`./vhamnn rank -s -b 3,6 datasets/iris.tab`

To calculate rank values using the same number of bins for all attributes:

`./vhamnn rank -s -b 3,3 datasets/iris.tab`

To exclude missing values from the rank value calculations:

`./vhamnn rank -- exclude --show --graph datasets/anneal.tab` or 


`./vhamnn rank -s -g -e datasets/anneal.tab`

## To explore how varying parameters affect classification accuracy
`./vhamnn explore --expand --graph --concurrent --weight datasets/breast-cancer-wisconsin-disc.tab` or

`./vhamnn explore -e -g -c -w datasets/breast-cancer-wisconsin-disc.tab`

To specify how the number of attributes should be varied (eg, from 2 through 8 attributes, inclusive, stepping by 2):

`./vhamnn explore -e -g -c -w --attributes 2,8,2 datasets/breast-cancer-wisconsin-disc.tab`

For datasets with continuous attributes, specify the binning range (eg, from 3 through 30 bins, stepping by 3):

`./vhamnn explore -s -g -c -w --bins 3,30,3 datasets/iris.tab`

To use the same number of bins for each attribute, add the -u or --uniform flag:

`./vhamnn explore -s -g -c -w -b 3,30,3 -u datasets/iris.tab`
