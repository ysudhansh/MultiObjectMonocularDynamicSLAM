List of improper lane data not be test:

0018 -> car 1 : all bad
	car 2 : test only 162 - 230
	car 3 : test all

Directory structure of OUTPUT:

ANALYSIS -> can see just for visualization
POINTCLOUD_LANE -> files -> pointcloud data in xz
POINTCLOUD_LANE_BOUNDARY -> intermediate results, not of use
SWITCHING_FRACTIONS -> the files will tell the wt to be given to lane constraints. If -1, leave that frame. if num >= 0, process it.
WHICH_LANE -> the files will tell which lane the vehicle is in that needs to be extracted. If -1, leave that frame. if num >= 0, the lane id needs to be extracted from POINTCLOUD_LANE -> files


