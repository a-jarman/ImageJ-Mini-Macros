//Measures the mean grayscale value of each grayscale image (or ROI of image) in a stack
//Finds the mean, minimum and maximum mean values across slices, and the standard deviation of mean values across the slices

//open grayscale image - USER INPUT pathname and filename
ImgStackPathname = "pathname/filename.tif";
open(ImgStackPathname);
//select image - USER INPUT filename
selectWindow("filename.tif");

//set measurement parameter to "mean"
run("Set Measurements...", "mean redirect=None decimal=9");

//create an array to store grayscale mean vals for each slice
meanGrayEachSlice = newArray(nSlices);

//loop over stack
for (s = 1; s < (nSlices()+1) ; s++){
	setSlice(s);
	
	//Un-comment the next line to perform measurements only in a specific ROI: USER INPUT change index of ROI if necessary and un-commented
	//roiManager("Select", 0);
	
	//measure the average grayscale val in the ROI for this slice
	run("Measure");
	//add that value to an array
	meanGrayEachSlice[s-1] = getResult("Mean",(s-1));
//end stack loop
}

//Find the mean, minimum and maximum mean values across slices, and the standard deviation of mean values across the slices
Array.getStatistics(meanGrayEachSlice, min, max, mean, stdDev)

//Display the statistics calculated above
print("Minimum Mean = " + min);
print("Maximum Mean = " + max);
print("Mean Mean= " + mean);
print("Standard Deviation of Mean = " + stdDev);

