[![VHamNN Continuous Integration](https://github.com/holder66/VHamNN/actions/workflows/VHamNN%20Continuous%20Integration.yml/badge.svg)](https://github.com/holder66/VHamNN/actions/workflows/VHamNN%20Continuous%20Integration.yml)
![GitHub](https://img.shields.io/github/license/holder66/VHamNN)
# VHamNN
A Command Line Interface (CLI) app, for classification using a nearest neighbor algorithm based on Hamming distances. VHamNN makes use of the [holder66.hamnn ML library](https://github.com/holder66/hamnn).

You can use `VHamNN` with your own datasets, or with a selection of publicly available datasets that are widely used for demonstrating and testing ML classifiers, in the `datasets` directory. These files are either in [ARFF (Attribute-Relation File Format)](https://waikato.github.io/weka-wiki/formats_and_processing/arff_stable/) or in [Orange file format](https://orange3.readthedocs.io/projects/orange-data-mining-library/en/latest/reference/data.io.html).

What, another AI package? [Is that necessary?](https://github.com/holder66/vhamnn/blob/master/AI_for_rest_of_us.md)
And have a look here for a more complete [description and potential use cases](https://github.com/holder66/vhamnn/blob/master/description.md). 

[Glossary of terms](https://github.com/holder66/vhamnn/blob/master/glossary.md)

## Installation:
First, install V, if not already installed. On MacOS, Linux etc. you need `git` and a C compiler (For windows or android environments, see the [v lang documentation](https://github.com/vlang/v/blob/master/doc/docs.md#windows)) In a terminal:
```sh
git clone https://github.com/vlang/v
cd v
make
sudo ./v symlink	# add v to your PATH
```
Clone this github repository:
```sh
git clone https://github.com/holder66/vhamnn
cd vhamnn
v .                # compiles all the files in the folder
./vhamnn --help    # displays help information about the various commands
# and options available. More specific help information
# is available for each command.
```
Install the `holder66.hamnn` library:
```sh
cd ~       # go back to your home directory
v install holder66.hamnn
````
And a couple of other libraries:
```sh
v install vsl
v install etienne_napoleone.chalk
````

That's it!

## Tutorial:
`v run . examples go`

## Updating:
```sh
v up        # installs the latest release of V
git pull    # When you're in the vhamnn directory, this command pulls in the 
            # latest version of vhamnn
v update    # get the latest version of the libraries, including holder66.hamnn
v .         # recompile
```

## Getting help:
The V lang community meets on [Discord](https://discord.gg/vlang)

For bug reports, feature requests, etc., please raise an issue on github:

[for VHamNN](https://github.com/holder66/vhamnn)

[for HamNN](https://github.com/holder66/hamnn)


## Memory leak problem:

At the present time, if your code using the HamNN library (especially memory-intensive operations such as cross-validate or explore) dies without going to completion, it may be due to memory leaks caused by the V lang compiler. The best way to prevent these memory leaks is to compile with the gc flag, eg:
 ```sh
 v -gc boehm .
 ```
You may need to install the libgc or libgc-dev library, using "brew" or "apt".

## Speed things up:

Make sure you use the -c (--concurrent) flag to make use of available CPU cores.
Another huge speedup happens if you compile using the -prod (for production) option. The compilation itself takes longer, but the resulting code is highly optimized.
`v -prod .` or

`v -gc boehm -prod .`

And then run it, eg 

`./vhamnn explore -s -c datasets/iris.tab`

## Examples showing use of the Command Line Interface
Please see [examples_of_command_line_usage.md](https://github.com/holder66/vhamnn/blob/master/examples_of_command_line_usage.md)

## Example: typical use case, a clinical risk calculator

Health care professionals frequently make use of calculators to inform clinical decision-making. Data regarding symptoms, findings on physical examination, laboratory and imaging results, and outcome information such as diagnosis, risk for developing a condition, or response to specific treatments, is collected for a sample of patients, and then used to form the basis of a formula that can be used to predict the outcome information of interest for a new patient, based on how their symptoms and findings, etc. compare to those in the dataset.

Please see [clinical_calculator_example.md](https://github.com/holder66/vhamnn/blob/master/clinical_calculator_example.md).

## Example: finding useful information embedded in noise

Please see a worked example here: [noisy_data.md](https://github.com/holder66/vhamnn/blob/master/noisy_data.md)




## Previous versions
The most recent version (2012) was written in python; one can experiment with it via a [web-based interface](http://hammingnn.olders.ca). I’ve [posted test results](https://henry.olders.ca/wordpress/?p=613) using this classifier with a number of publicly accessible datasets. Here are some [additional test results](https://henry.olders.ca/wordpress/?p=381) with genomics datasets.

The process of development in its early stages is described in [this essay](https://henry.olders.ca/wordpress/?p=731) written in 1989.



Copyright (c) 2017, 2022: Henry Olders.
