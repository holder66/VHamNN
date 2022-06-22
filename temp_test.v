// temp_test.v
module main

import os
// import holder66.hamnn
// import tools

fn testsuite_begin() ? {
	// println(os.execute_or_panic('v up\nv update holder66.hamnn'))
	if os.is_file('vhamnn') {
		os.rm('vhamnn')?
	}
	os.execute_or_panic('v .')
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

// test_verify
fn test_verify() {
	// println(os.execute_or_panic('./vhamnn verify -h'))
	// println(os.execute_or_panic('./vhamnn verify -c -t datasets/bcw174test datasets/bcw350train'))
	// // save a classifier to a file
	// println(os.execute_or_panic('./vhamnn make -a 33 -b 2,16 -w -o tempfolder/soybean.cl datasets/soybean-large-train.tab'))
	// println(os.execute_or_panic('./vhamnn verify -c -w -s -k tempfolder/soybean.cl -t datasets/soybean-large-test.tab'))
	// println(os.execute_or_panic('./vhamnn explore -g -f 0 -c -a 3,4 -b 6,8  datasets/prostata.tab'))
	// println(os.execute_or_panic('./vhamnn explore -g -e -c -o tempfolder/breast.exr datasets/breast-cancer-wisconsin-disc.tab'))
}
