## Compile the app
`cd hamnn`

`v -gc boehm .`

Now you can run the app with command line entries starting with `./vhamnn`, 
as in `./vhamnn analyze datasets/anneal.tab`.
However, I find it more convenient to start with `v run .`, as in
`v run . verify -c  -t datasets/bcw174test datasets/bcw350train`.

## Getting help
`v run . --help` or
`v run . -h` or simply, 
`v run .`

For individual commands, use this pattern:

`v run . analyze --help` or `v run . analyze -h` or `v run . analyze`

## Analyzing a dataset
`v run . analyze datasets/anneal.tab`

## Discovering which attributes are most useful
`v run . rank --show --graph datasets/anneal.tab` or

`v run . rank -s -g datasets/anneal.tab`

To specify a range for the number of bins for continuous attributes (if unspecified, the default range is 2 through 16 inclusive):

`v run . rank --show --bins 3,6 datasets/iris.tab` or 

`v run . rank -s -b 3,6 datasets/iris.tab`

To calculate rank values using the same number of bins for all attributes:

`v run . rank -s -b 3,3 datasets/iris.tab`

To exclude missing values from the rank value calculations:

`v run . rank -- exclude --show --graph datasets/anneal.tab` or 


`v run . rank -s -g -e datasets/anneal.tab`

## To explore how varying parameters affect classification accuracy
`v run . explore --expand --graph --concurrent --weight datasets/breast-cancer-wisconsin-disc.tab` or

`v run . explore -e -g -c -w datasets/breast-cancer-wisconsin-disc.tab`

To specify how the number of attributes should be varied (eg, from 2 through 8 attributes, inclusive, stepping by 2):

`v run . explore -e -g -c -w --attributes 2,8,2 datasets/breast-cancer-wisconsin-disc.tab`

For datasets with continuous attributes, specify the binning range (eg, from 3 through 30 bins, stepping by 3):

`v run . explore -s -g -c -w --bins 3,30,3 datasets/iris.tab`

To use the same number of bins for each attribute, add the -u or --uniform flag:

`v run . explore -s -g -c -w -b 3,30,3 -u datasets/iris.tab`
