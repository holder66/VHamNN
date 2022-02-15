// main_test.v
module main

import os
// import holder66.hamnn
// import tools

fn testsuite_begin() ? {
	println(os.execute_or_panic('v up\nv update holder66.hamnn'))
	if os.is_file('vhamnn') {
		os.rm('vhamnn') ?
	}
	os.execute_or_panic('v -gc boehm .')
	if os.is_dir('tempfolder') {
		os.rmdir_all('tempfolder') ?
	}
	os.mkdir_all('tempfolder') ?
}

fn testsuite_end() ? {
	if os.is_file('vhamnn') {
		os.rm('vhamnn') ?
	}
	os.rmdir_all('tempfolder') ?
}

// test_explore
fn test_explore() {
	println(os.execute_or_panic('./vhamnn explore --help'))
	println(os.execute_or_panic('./vhamnn explore -g datasets/iris.tab'))
	// println(os.execute_or_panic('./vhamnn explore -g -f 0 -c -a 3,4 -b 6,8  datasets/prostata.tab'))
	println(os.execute_or_panic('./vhamnn explore -g -e -c -o tempfolder/breast.exr datasets/breast-cancer-wisconsin-disc.tab'))
}

// test_verify
fn test_verify() {
	println(os.execute_or_panic('./vhamnn verify -h'))
	println(os.execute_or_panic('./vhamnn verify -c -t datasets/bcw174test datasets/bcw350train'))
	// save a classifier to a file
	println(os.execute_or_panic('./vhamnn make -a 33 -b 2,16 -w -o tempfolder/soybean.cl datasets/soybean-large-train.tab'))
	println(os.execute_or_panic('./vhamnn verify -c -w -s -k tempfolder/soybean.cl -t datasets/soybean-large-test.tab'))
}

// test_analyze
fn test_analyze() {
	println(os.execute_or_panic('./vhamnn'))
	println(os.execute_or_panic('./vhamnn analyze datasets/developer.tab'))
	// println(os.execute_or_panic('./vhamnn analyze datasets/bcw174test'))
	// println(os.execute_or_panic('./vhamnn analyze datasets/iris.tab'))
}

// test_make
fn test_make() {
	println(os.execute_or_panic('./vhamnn make'))
	println(os.execute_or_panic('./vhamnn make -a 7 -b 3,7 datasets/developer.tab'))
	println(os.execute_or_panic('./vhamnn make -a 7 -b 3,7 -x -e -o tempfolder/dev.cl datasets/developer.tab'))
}

// test_cross
fn test_cross() {
	println(os.execute_or_panic('./vhamnn cross --help'))
	println(os.execute_or_panic('./vhamnn cross -c datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn cross -c -e -a 2 -b 3,6 datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn cross -c -e -a 2 -b 3,6 -f 10 -w datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn cross -c -e -a 6 -b 3,6 -f 20 -w datasets/prostata.tab'))
}

// test_append
fn test_append() ? {
	// make a classifier
	println(os.execute_or_panic('./vhamnn make -a 4 -o tempfolder/bcw.cl datasets/bcw350train'))
	// make an instances file by doing a validation
	println(os.execute_or_panic('./vhamnn validate -k tempfolder/bcw.cl -o tempfolder/bcw.inst -t datasets/bcw174test'))
	// use the instances file to append to the saved classifier
	println(os.execute_or_panic('./vhamnn append -k tempfolder/bcw.cl -o tempfolder/bcw-ext.cl tempfolder/bcw.inst'))
}

// test_rank_attributes
fn test_rank_attributes() {
	// os.execute_or_panic('v hamnn.v')
	// println(os.execute_or_panic('./vhamnn rank -h'))
	println(os.execute_or_panic('./vhamnn rank'))
	println(os.execute_or_panic('./vhamnn rank datasets/developer.tab'))
	println(os.execute_or_panic('./vhamnn rank -x -b 3,3 datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn rank -b 2,6 -x -a 2 datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn rank --bins 4,12  -x datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn rank -x -g datasets/anneal.tab'))
}

// test_flag
fn test_flag() {
	mut args := ['rank', '-h']
	assert flag(args, ['-h', '--help', 'help']) == true
}

// test_option
fn test_option() {
	println('option returned: ${option(['2,6', '-x', 'true', 'datasets/iris.tab'], [
		'-x',
		'--exclude',
	])}')
	assert option(['--bins', '2,6', '-x', 'true', 'datasets/iris.tab'], ['-x', '--exclude']) == 'true'
	assert option(['--bins', '2,6', '--exclude', 'false', 'datasets/iris.tab'], ['-x', '--exclude']) == 'false'
	assert option(['-b', '2,6', '-x', 'true', 'datasets/iris.tab'], ['-b', '--bins']) == '2,6'
	assert option(['--bins', '2,6', '-x', 'true', 'datasets/iris.tab'], ['-b', '--bins']) == '2,6'
}
