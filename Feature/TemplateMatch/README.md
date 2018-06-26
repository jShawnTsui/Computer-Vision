# Template Matching: Where is Waldo?
[Back to Computer Vision Projects List][1]
It manually selects a sample of Waldo, and get the maximum frequency in y-axis. 
And makes a Gabor filter based on the frequency. Then convolute the preprocessed 
image with that filter, to find the local maxima above a threshold in the response, 
where have great chances to be the Waldo’s.

The Original Image:
<p align="center">
  <img src="https://github.com/jShawnTsui/Computer-Vision/blob/master/Feature/TemplateMatch/waldo.jpg" width="500"/>
</p>

Waldo found after running program:
<p align="center">
  <img src="https://github.com/jShawnTsui/Computer-Vision/blob/master/Feature/TemplateMatch/untitled.jpg" width="500"/>
</p>

[Back to Computer Vision Projects List][1]
[1]:https://github.com/jShawnTsui/Computer-Vision
