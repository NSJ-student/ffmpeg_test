ARCH=arm-linux-gnueabihf
#ARCH=i386-linux-gnu
#GST_VERSION=1.0
# sudo apt-get install libavcodec libavformat libavutil libavfilter libavdevice libswresample libswscale

CC	= gcc
CFLAGS	= 
LFLSGS	= 
LDFLAGS	= 
SOURCE  =   main.cpp

FFMPEG_LIBS=    libavdevice                        \
                 libavformat                        \
                 libavfilter                        \
                 libavcodec                         \
                 libswresample                      \
                 libswscale                         \
                 libavutil
    
SOURCE_BACK = load_list.c \
		tplayer_back.c

#PC_PATH = /home/$(USER)/gst_1.8.0/out/lib/pkgconfig
PC_PATH = /usr/lib/arm-linux-gnueabihf/pkgconfig/
 
#CFLAGS	+= $(shell PKG_CONFIG_PATH=$(PC_PATH) pkg-config --cflags gstreamer-video-1.0)
#CFLAGS	+= $(shell PKG_CONFIG_PATH=$(PC_PATH) pkg-config --cflags gstreamer-1.0)
CFLAGS	+= $(shell PKG_CONFIG_PATH=$(PC_PATH) pkg-config --cflags gtk+-3.0)
CFLAGS	+= $(shell PKG_CONFIG_PATH=$(PC_PATH) pkg-config --cflags $(FFMPEG_LIBS))
CFLAGS	+= -I/usr/include/glib-2.0
CFLAGS	+= -I/usr/lib/$(ARCH)/glib-2.0/include
#CFLAGS	+= -I/usr/include/libxml2
#IPATHS	+= -I/usr/include/gstreamer-$(GST_VERSION)
#IPATHS	+= -I/usr/lib/$(ARCH)/gstreamer-1.0/include
#CFLAGS	+= -I/home/$(USER)/gst_1.8.0/out/include/gstreamer-1.0
#CFLAGS	+= -I/home/$(USER)/gst_1.8.0/out/lib/gstreamer-1.0/include
#CFLAGS	+= -I/home/$(USER)/gst_1.8.0/gst-plugins-base-1.8.0/sys/xvimage
#CFLAGS	+= -I/usr/include/gdk-pixbuf-2.0

#LFLAGS	+= $(shell PKG_CONFIG_PATH=$(PC_PATH) pkg-config --libs gstreamer-video-1.0)
#LFLAGS	+= $(shell PKG_CONFIG_PATH=$(PC_PATH) pkg-config --libs gstreamer-1.0)
LFLAGS	+= $(shell PKG_CONFIG_PATH=$(PC_PATH) pkg-config --libs  $(FFMPEG_LIBS))
#LFLAGS	+= -L/home/$(USER)/gst_1.8.0/out/lib/
#LFLAGS	+= -L/home/$(USER)/gst_1.8.0/out/lib/gstreamer-1.0
#LFLAGS	+= -lgobject-2.0 -lX11 -lrt -lXrender -lXrandr -lm
LFLAGS	+= -lgobject-2.0 -lm

#LDFLAGS	+= -Wl,-rpath=/home/$(USER)/gst_1.8.0/out/lib/
#LDFLAGS	+= -Wl,-rpath=/home/$(USER)/gst_1.8.0/out/lib/gstreamer-1.0

all: $(SOURCE)
	$(CC) -o main $(SOURCE) $(LDFLAGS) $(LFLAGS) $(CFLAGS) 

debug: $(SOURCE)
	$(CC) -g -o debug_test $(SOURCE) $(LDFLAGS) $(LFLAGS) $(CFLAGS) 

clean:
	rm -f test
	