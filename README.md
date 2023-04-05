Instant NGP Batch Readme:


# Batch Scripts for NVIDIA's Instant-NGP Windows Binaries

NVIDIA Released Windows binaries for their popular [Instant-NGP](https://github.com/NVlabs/instant-ngp). Their binaries let you drag datasets into the GUI assuming you have image-based datasets that have been prepared for training ahead of time. For the no-code community, working with a command line interface can be daunting. To this end, I have created two universal batch files that streamline image prep to NeRF training without the need to use a command line interface.

[Watch My Video On 1 Click Automation for NeRFs](https://www.youtube.com/watch?v=-ummgy1Qy00)

## Requirements

### Binaries

You will need the offcial binary release of Instant-NGP that matches your GPU model. I provided links below from NVIDIA to the binary release packages. However, I suggest you use the download links from NVIDIA's [Instant-NGP Github Repository](https://github.com/NVlabs/instant-ngp).  

- [**RTX 3000 & 4000 series, RTX A4000&ndash;A6000**, and other Ampere & Ada cards](https://nightly.link/NVlabs/instant-ngp/workflows/main/master/Instant%20NGP%20for%20RTX%203000%20%26%204000%20%28Ampere%20%26%20Ada%29.zip)
- [**RTX 2000 series, Titan RTX, Quadro RTX 4000&ndash;8000**, and other Turing cards](https://nightly.link/NVlabs/instant-ngp/workflows/main/master/Instant%20NGP%20for%20RTX%202000%20%28Turing%29.zip)
- [**GTX 1000 series, Titan Xp, Quadro P1000&ndash;P6000**, and other Pascal cards](https://nightly.link/NVlabs/instant-ngp/workflows/main/master/Instant%20NGP%20for%20GTX%201000%20%28Pascal%29.zip)


### Python
This release has been tested using Python 3.9.7. If you do not have Python currently installed, I recommend using Anaconda to install Python 3.9. [You can install the latest version of Anaconda here.](https://www.anaconda.com/products/distribution) **Note: ensure Python is added to your system PATH during installation.**


**Python Requirements**
You will need to install the Instant NGP Python requirements. I created a simple install_requirements.bat file to install all of the neccessary requirements with a simple click. Just place the file in the same folder as the Instant-NGP executable and double click to run the file.

Alternatively, you can open a new command prompt window from the root of the binaries folder and run `pip install -r requirements.txt`.


### CUDA Toolkit
CUDA Toolkit 11.5 or higher - [You can download the latest version here](https://developer.nvidia.com/cuda-toolkit)


### FFMPEG
You will need FFMPEG to extract images from video and to render videos from the Instant NGP GUI. If you do not have FFMPEG installed, you can simply run the **download_ffmpeg.bat** file located in the *scripts* subfolder of the Instant-NGP Binaries folder. 

**Note:** don't forget to add FFMPEG to your system PATH.


### COLMAP
You will need COLMAP to prepare the images for training. If you do not have COLMAP installed, you can simply run the **download_colmap.bat** file located in the *scripts* subfolder of the Instant-NGP Binaries folder

Alternatively, you can download the windows executable version from the official github page [here](https://github.com/colmap/colmap/releases/download/3.7/COLMAP-3.7-windows-cuda.zip).

**Note:** don't forget to add COLMAP to your system PATH. 


### Vulkan SDK (Optional) 
You will need to download the [Vulkan SDK](https://vulkan.lunarg.com/) for DLSS support.


## Installation
Place the nerf_photos.bat and nerf_video.bat files in the folder containing the Instant-NGP files you extracted from NVIDIA's binary release zip. That's it, you're done!

<img width="528" alt="Nerfbatchfiles" src="https://user-images.githubusercontent.com/82414293/211089965-80bcc291-b3fb-47a9-88bf-2fedef968e08.png">


## Creating a NeRF From Video
The nerf_video.bat file runs a sequence of operations to extract images, prepare a transforms file, and kick of training. Simply, drag a video file into the nerf_video.bat file and the sequence will automatically start. Choose an FPS extraction value and push enter. I recommend picking a value that value that will result in 150-300 images maximum. 

Once image preparation completes, the Instant NGP GUI will automatically launch and training will kick off. You will find a transforms.json file at the same location as the source video. In the future, you can drag this file into a new Instant-NGP GUI session and training will begin.

**Warninig: this batch file only works with files and folders without spaces and special characters** 


## Creating a NeRF From Photos
The nerf_photos.bat file runs a sequence of operations that prepare a transforms file, and kick of training. Simply, drag a folder of imagese into the nerf_photos.bat file and the sequence will automatically start. 

Once image preparation completes, the Instant NGP GUI will automatically launch and training will kick off. You will find a transforms.json file at the parent folder level of images folder. In the future, you can drag this file into a new Instant-NGP GUI session and training will begin. You can also move the transforms file into the images folder in order to keep data tidy.

**Tip:** Image preparation from images uses exhaustive feature matching by default. This can take quite a bit of time. If you images are taken in spatial sequence, you can speed up training by editing the batch file. Change the --colmap_matcher value from "exhuastive" to "sequential" 

**Warninig: this batch file only works with files and folders without spaces and special characters** 


## Additional Training Tips
I suggest reading NVIDIA's official tips for capturing and training images into NeRFs. You can find their official document [here](https://github.com/NVlabs/instant-ngp/blob/master/docs/nerf_dataset_tips.md)
