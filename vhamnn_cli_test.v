// vhamnn_test.v
module main

import os

fn testsuite_begin() ? {
	if os.is_file('vhamnn') {
		os.rm('vhamnn')?
	}
	os.execute_or_panic('v -gc boehm .')
	if os.is_dir('tempfolder') {
		os.rmdir_all('tempfolder')?
	}
	os.mkdir_all('tempfolder')?
}

fn testsuite_end() ? {
	if os.is_file('vhamnn') {
		os.rm('vhamnn')?
	}
	os.rmdir_all('tempfolder')?
}

// test_explore
fn test_explore() {
	println(os.execute_or_panic('v run . explore --help'))
	println(os.execute_or_panic('v run . explore -g datasets/iris.tab'))
	println(os.execute_or_panic('v run . explore -g -a 2 -b 6  -c datasets/leukemia34test.tab'))
	println(os.execute_or_panic('v run . explore -g -e -c -o tempfolder/breast.exr datasets/breast-cancer-wisconsin-disc.tab'))
	println(os.execute_or_panic('v run . cross -c -w -e -a 13 datasets/UCI/zoo.arff'))
}

// test_verify
fn test_verify() {
	println(os.execute_or_panic('v run . verify -h'))
	println(os.execute_or_panic('v run . verify -c -t datasets/bcw174test datasets/bcw350train'))
	// save a classifier to a file
	println(os.execute_or_panic('v run . make -a 33 -b 2,16 -w -o tempfolder/soybean.cl datasets/soybean-large-train.tab'))
	println(os.execute_or_panic('v run . verify -c -w -s -k tempfolder/soybean.cl -t datasets/soybean-large-test.tab'))
}

// test_analyze
fn test_analyze() {
	println(os.execute_or_panic('v run .'))
	println(os.execute_or_panic('v run . analyze datasets/developer.tab'))
	// println(os.execute_or_panic('v run . analyze datasets/bcw174test'))
	// println(os.execute_or_panic('v run . analyze datasets/iris.tab'))
}

// test_make
fn test_make() {
	println(os.execute_or_panic('v run . make'))
	println(os.execute_or_panic('v run . make -a 7 -b 3,7 datasets/developer.tab'))
	println(os.execute_or_panic('v run . make -a 7 -b 3,7 -x -e -o tempfolder/dev.cl datasets/developer.tab'))
}

// test_cross
fn test_cross() {
	println(os.execute_or_panic('v run . cross --help'))
	println(os.execute_or_panic('v run . cross -c datasets/iris.tab'))
	println(os.execute_or_panic('v run . cross -c -e -a 2 -b 3,6 datasets/iris.tab'))
	println(os.execute_or_panic('v run . cross -c -e -a 2 -b 3,6 -f 10 -w datasets/iris.tab'))
	println(os.execute_or_panic('v run . cross -c -e -a 6 -b 3,6 -f 20 -w datasets/prostata.tab'))
	println(os.execute_or_panic('v run . cross -c -w -e -a 13 datasets/UCI/zoo.arff'))
}

// test_append
fn test_append() ? {
	// make a classifier
	println(os.execute_or_panic('v run . make -a 4 -o tempfolder/bcw.cl datasets/bcw350train'))
	// make an instances file by doing a validation
	println(os.execute_or_panic('v run . validate -k tempfolder/bcw.cl -o tempfolder/bcw.inst -t datasets/bcw174test'))
	// use the instances file to append to the saved classifier
	println(os.execute_or_panic('v run . append -k tempfolder/bcw.cl -o tempfolder/bcw-ext.cl tempfolder/bcw.inst'))
}

// test_rank_attributes
fn test_rank_attributes() {
	// os.execute_or_panic('v hamnn.v')
	// println(os.execute_or_panic('v run . rank -h'))
	println(os.execute_or_panic('v run . rank'))
	println(os.execute_or_panic('v run . rank datasets/developer.tab'))
	println(os.execute_or_panic('v run . rank -x -b 3,3 datasets/iris.tab'))
	println(os.execute_or_panic('v run . rank -b 2,6 -x -a 2 datasets/iris.tab'))
	println(os.execute_or_panic('v run . rank --bins 4,12  -x datasets/iris.tab'))
	println(os.execute_or_panic('v run . rank -x -g datasets/anneal.tab'))
}

// test_display
fn test_display() {
	println(os.execute_or_panic('v run . cross -c -b 2,4 -a 4 -o tempfolder/cross_result.txt datasets/developer.tab'))
	println(os.execute_or_panic('v run . display -e tempfolder/cross_result.txt'))
	println(os.execute_or_panic('v run . rank -o tempfolder/rank_result.txt datasets/UCI/segment.arff'))
	println(os.execute_or_panic('v run . display -g tempfolder/rank_result.txt'))
}
