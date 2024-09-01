//open H&E image - USER INPUT pathname and filename
ImgPathname = "pathname/filename.tif";
open(ImgPathname);
//select H&E image - USER INPUT filename
selectWindow("filename.tif");
//get outline of tissue
run("HSB Stack");
run("Stack to Images");
selectWindow("Hue");
setAutoThreshold("Default dark");
run("Convert to Mask", "method=Default background=Dark calculate");
//remove little background selected bits (filtered by size) - USER INPUT size range
run("Analyze Particles...", "size=10-Infinity display add stack");

//rename roi H&E outline, assuming is last entry in roi manager
roiManager("Select", (roiManager("count")-1));
roiManager("Rename", "H&Eoutline");

//close the separate HSB images
selectWindow("Hue");
close();
selectWindow("Saturation");
close();
selectWindow("Brightness");
close();
