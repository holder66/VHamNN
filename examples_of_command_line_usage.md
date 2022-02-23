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

`v run . rank --exclude --show --graph datasets/anneal.tab` or 

`v run . rank -s -g -e datasets/anneal.tab`

## Working with large datasets
Doing a leave-one-out cross-validation on a large dataset can be time-consuming. Save time by doing fewer folds, eg 10-fold (`-f 10`). Repeat the exercise 5 times (`-r 5`); results are averaged over the 5 repetitions, since random selection of instances for folding means that results will be different for one repetition to another:

`v run . analyze datasets/mnist_test.tab`

`v -gc boehm run . cross -s -e -f 10 -r 5 -a 310 -b 2,2 -c datasets/mnist_test.tab`

## To explore how varying parameters affect classification accuracy
`v run . explore --expand --graph --concurrent --weight datasets/breast-cancer-wisconsin-disc.tab` or

`v run . explore -e -g -c -w datasets/breast-cancer-wisconsin-disc.tab`

To specify how the number of attributes should be varied (eg, from 2 through 8 attributes, inclusive, stepping by 2):

`v run . explore -e -g -c -w --attributes 2,8,2 datasets/breast-cancer-wisconsin-disc.tab`

For datasets with continuous attributes, specify the binning range (eg, from 3 through 30 bins, stepping by 3):

`v run . explore -s -g -c -w --bins 3,30,3 datasets/iris.tab`

To use the same number of bins for each attribute, add the -u or --uniform flag:

`v run . explore -s -g -c -w -b 3,30,3 -u datasets/iris.tab`
