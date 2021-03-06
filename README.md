# GTFiber-Windows
This is the public-facing repository for the Windows version of GTFiber. GTFiber is an open source program for automated quantitative analysis of images of fibrillar microstructures.

See [GTFiber for Mac](https://github.com/Imperssonator/GTFiber-Mac) for Mac OSX.

## Running in MATLAB
* [Download](https://github.com/Imperssonator/GTFiber-Windows/archive/master.zip) the repository to your local machine
* Extract the repository to your MATLAB active directory
* Run the command "GTFiber" in MATLAB while in the extracted folder
* Operate the GUI by following the instructions in "Using GTFiber" below!

## Installing the Standalone App
GTFiber comes with an installer that enables users to run the program without MATLAB. After [downloading](https://github.com/Imperssonator/GTFiber-Windows/archive/master.zip)
the repository, run "Install the App" and follow the prompts. It will instruct you to download the Matlab Compiler Runtime, which is approximately 700MB, and is necessary to run MATLAB GUIs outside of the MATLAB environment. 
At the end of installation, it has instructions to change or edit some system files - ignore this and continue. If there are issues, please email me at npersson3@gatech.edu.

Run the application from the Start menu. Wait at least one minute, even if it appears nothing is happening on your screen. The Matlab Runtime is being loaded and does not display any message to indicate this is happening. Loading should be faster after opening the program for the first time.

## Using GTFiber

### Loading an Image
* File -> Load Image
* Enter the image's width (not height) in nanometers, with no commas - for example, 5000
* Wait until a figure appears showing your original image. Do not close this figure - the image must be re-loaded to bring it back up.
* The name of your image will appear in the upper right once the loading is complete as well.

### Choose Filter Parameters
* Each filter parameter has an editable text box. Enter desired filter parameters, again, with no commas.
* Filter parameters are generally expressed in nanometers so that they work on images of different resolution, but the same physical size
* To view the result after any step of filtering, check its "Display Result" box
* Click "Run Filter" and wait for all progress bars to complete and disappear

### Plot Results
* After clicking "Run Filter", click "Orientation Map" or "OP 2D" to display figures for the calculated results.

### Running a Directory of Images
* "Run a Directory..." will apply your current filter parameters to each image file in a specified directory and output the raw results to a .csv file in that directory
* If you would like to save the Orientation Map, Orientation Distribution, and 2D order parameter decay plot as figures for each image, check "Save Figures" below the "Run a Directory..." button
* Allow progress bars to complete, then open the directory to view your results.
* Images in a single directory should be the same physical size, e.g. 5000 x 5000nm, because the specified Image Width will be applied to all

### Examples
GTFiber comes with example images from the protocol paper in which it was introduced, to show what each step looks like with good filter parameters.

* Load an image from the "Example Images" folder, such as "Fig 5A 5000nm.tif"
* Enter the size of the image, specified in the image's file name
* Change the default settings to reflect those listed in the caption of Figure 5 of the main paper (defaults are pretty close already)
* Click "Run Filter", wait for processing to complete
* Click "Orientation Map"
* Click "OP 2D"
