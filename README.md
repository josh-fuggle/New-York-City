__Disneyland__ is a set of image processing tools that I have created to help me improve my photo management workflow.
Why __Disneyland__? Well, this is a set of tools for photographers. So I named the tool after the most photographed place on Earth, according to Instagram.

What tools does it contain? Just two so far:

1. `rename`: Rename allows you to batch rename your image files in to the format of ALBUM_YYYYMMDD_HHMMSS_MANUFACTURER.

Reasoning
> I was sick of seeing a set of manufacturer defined, auto-incrementing file names.
> I take photos with an iPhone, a GoPro, and a DSLR and needed a file format that was consistent
> no matter what device the photo was shot on.

Example

`IMG_2967.JPG` -> `RANDOM_20150620_091704_IPHONE.JPG`

2. `convert`: Convert simply converts your images from a RAW format to JPG.

Reasoning
> I like to shoot firstly in RAW, and convert later. RAW files are large and it takes my computer a 
> long time to render a preview of the file. If I were to upload RAW to a service such as Flickr or
> Google Photos then I would quickly reach the quota limits of the services.
> All the GUI tools that I have used to perform this task either cost money or fall over when I batch
> process a reasonably large number of files.
> Convert will crawl through a directory for you, and convert all the RAWs it finds in to JPGs so that you
> can easily overcome these issues.
