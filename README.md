# Detecting Wipe Transitions in Videos with MatLab

### This program takes a short video and outputs an image that can be used to find a wipe transition somewhere in the video.

### The file hicomparecol.m is the main function. It has two parts, first it receives two images and a column number, then it isolates the specified columns of both images and creates a red-green chromaticity matrix of the original RGB values through the function {r, g} = {R,G}/(R + G + B). We then take our red-green chromaticity matrices and create normalized 2D histograms of each. Then we calculate the histogram intersection of both histograms and return the number as an output.

### The file program.m retrieves the video file and processes it so that it can feed hicomparecol.m the necessary frames and column numbers. After it receives the histogram intersections, it compiles them into a matrix which we can output as a PNG image. The code will output two images, image1.png is the untouched matrix and image2.png is the threshold image with the 30% darkest values.

### Sample Input Frames
<p float="left">
  <img src="/scene00001.jpg" width="100" />
  <img src="/scene00041.jpg" width="100" />
  <img src="/scene00051.jpg" width="100" />
  <img src="/scene00061.jpg" width="100" />
  <img src="/scene00101.jpg" width="100" />
</p>

### Sample Output Image
<img src="/image1.png" width="30%"/>
