//automate conversion of bruker pv4 2dseq mri file to jpeg and tif images
imgdir = getDirectory("select directory with MRI imaging folders");
folders = getFileList(imgdir);
slices = getNumber("how many slices are in the image - default = 25", 25);
matrix = split(getString("what is the X by Y dimension of the image - default = 256x256", "256x256"),"x");
out_matrix = split(getString("what is the X by Y dimension of the output image - default = 512x512","512x512"),"x");
subfolders = split(getString("what subfolders contain images - default = 2,3","2,3"),",");
suffixes = split(getString("what suffixes should be appended to the files - default = T2A,T2C","T2A,T2C"),",");
output_format = getString("what output format do you want - default = Tiff","Tiff");


matrix_x = parseInt(matrix[0]);
matrix_y = parseInt(matrix[1]);
out_matrix_x = parseInt(matrix[0]);
out_matrix_y = parseInt(matrix[1]);

for (f=0; f<folders.length; f++) {
	cur_folder = folders[f];
	if (endsWith(cur_folder,"/")) {
		for (i=0; i<subfolders.length; i++) {
			if (File.exists(imgdir+cur_folder+subfolders[i]+"/pdata/1/2dseq")){
			path1 = imgdir+cur_folder+subfolders[i]+
				"/pdata/1/2dseq'] image=[16-bit Signed] width="+
				matrix_x+
				" height="+
				matrix_y+
				" number="+
				slices+
				" little-endian";
			cur_folder_name = substring(cur_folder,0,lengthOf(cur_folder)-1);
			print(path1);

			run("Raw...", "open='"+path1);
			run("Size...", "width="+
				out_matrix_x+
				" height="+
				out_matrix_y+
				" depth="+
				slices+
				" average interpolation=Bilinear"
			);
			rename(suffixes[i]);
			saveAs(output_format,imgdir+cur_folder_name+"-"+suffixes[i]);

			run("Make Montage...", "scale=1");
			saveAs(output_format,imgdir+cur_folder_name+"-"+suffixes[i]+"montage");
			saveAs("jpg",imgdir+cur_folder_name+"-"+suffixes[i]+"montage");
			run("Close All");
		}}
	}
}
