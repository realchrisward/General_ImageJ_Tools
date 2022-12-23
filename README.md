# General_ImageJ_Tools
a collection of macros that help with image analysis
(C) Christopher Ward 2022

the code is distributed free of use, acknowledgements/citations appreciated if you use/modify the code

## Included Tools

### image extract_gui.ijm

tool provides a minimal GUI based workflow to extract MRI images
from subfolders created during acquisition using Bruker Biospin
Paravision 4 software.

The user specifies parameters of the image (including acquired
pixel and slice settings) and desired output modifications.

The tool works well with the FIJI distribution of ImageJ.

### Optical Disector Grid.ijm
A simple imageJ implimentation of an optical disector grid for stereological counting.
A grid is created that subdivides an image into set number of pieces [sampefract].
Counting boxes are then placed within these pieces and are themselves a subfraction of the region [boxfract].
Cell counts can then be scaled up by a factor of (samplefract*boxfract).
This tool should be compatable with "Cell Counter" plug-in.

### Flatten and Fractionate.ijm
Flattens an image stack and burns in a ROI. An Optical Disector Grid is overlayed.

### ray intensity quantification.ijm
a tool to aid the used in sampling pixel intensities of cells of interest, best if used in combination with a tool to create a systematic random sampling grid.
