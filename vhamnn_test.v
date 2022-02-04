// main_test.v
module main

import os
import holder66.hamnn
// import tools

fn testsuite_begin() ? {
	if os.is_file('vhamnn') {os.rm('vhamnn') ?}	
	os.execute_or_panic('v -gc boehm .')
}

fn testsuite_end() ? {
	if os.is_file('vhamnn') {os.rm('vhamnn') ?}	
}

// test_load_file_newer verify that load_file works with an orange-newer datafile
fn test_load_file_newer() {
	path := 'datasets/developer.tab'
	ds := hamnn.load_file(path)
	assert ds.attribute_names == ['firstname', 'lastname', 'age', 'gender', 'height', 'weight',
		'SEC', 'city', 'number', 'negative']
	assert ds.data[0] == ['Henry', 'John', 'Will', 'Flo', 'Star', 'Jonathan', 'Aislin', 'Agatha',
		'Job', 'Broderick', 'Tom', 'Dick', 'Harry']
}

// test_analyze_datafile
fn test_analyze_datafile() {
	// os.execute_or_panic('v vhamnn.v')
	println(os.execute_or_panic('./vhamnn'))
	println(os.execute_or_panic('./vhamnn analyze datasets/developer.tab'))
	println(os.execute_or_panic('./vhamnn analyze datasets/bcw174test'))
	println(os.execute_or_panic('./vhamnn analyze datasets/iris.tab'))
}

// test_rank_attributes
fn test_rank_attributes() {
	// os.execute_or_panic('v hamnn.v')
	println(os.execute_or_panic('./vhamnn rank -h'))
	println(os.execute_or_panic('./vhamnn rank'))
	println(os.execute_or_panic('./vhamnn rank datasets/developer.tab'))
	println(os.execute_or_panic('./vhamnn rank -x true -r 3,3 -s  datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn rank -r 2,6 -x true --show  datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn rank -s --range 2,6 -x true  datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn rank -x false --show datasets/iris.tab'))
	println(os.execute_or_panic('./vhamnn rank -x true -s datasets/anneal.tab'))
	println(os.execute_or_panic('./vhamnn rank -x true -s --graph datasets/anneal.tab'))
	println(os.execute_or_panic('./vhamnn rank --range 3,5 -s datasets/developer.tab'))
	println(os.execute_or_panic('./vhamnn rank -s -r 2,6 datasets/developer.tab'))
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
