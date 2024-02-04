#! /bin/bash

echo "You are about to create a boot USB disk. Enter the full path to the image:"
read IMAGE_PATH

echo "Enter the name of the image file:"
read IMAGE_NAME

echo "What disk do you want to use for your boot USB? (write the letter on your choice)"
sudo lsblk | grep disk
read -p "sd" X

echo "You are about to write changes to the disk /dev/sd$X. This will erase everything from your disk."
while true; do
	read -p "Are you sure you want to continue? yes/no: " userInput
	if [ "$userInput" = "no" ] || [ "$userInput" = "n" ]; then
		exit 1
	elif [ "$userInput" = "yes" ] || [ "$userInput" = "y" ]; then
		break
	else
		continue
	fi
done

sudo apt update
sudo apt install pv -y

# write image to the disk
pv $IMAGE_PATH/$IMAGE_NAME | sudo dd oflag=direct iflag=fullblock of=/dev/sd$X bs=4M;sync

# get image check sum
echo "Counting image check sum..."
image_size=$(du -b $IMAGE_PATH/$IMAGE_NAME | cut -f1)
image_check_sum=$(md5sum $IMAGE_PATH/$IMAGE_NAME | cut -d" " -f1)
echo $image_check_sum

# get usb check sum
echo "Counting usb check sum..."
#usb_check_sum=$(sudo md5sum /dev/sd$X | cut -d" " -f1)
usb_check_sum=$(sudo head -c $image_size /dev/sd$X | md5sum | cut -d" " -f1)
echo $usb_check_sum

# check sum verification
if [ $image_check_sum == $usb_check_sum ]; then
	echo "Check sum verification is successful"
	echo $IMAGE_NAME has been successfully written to the disk. Ура, товарищи!
	sudo eject /dev/sd$X
	echo USB disk sd$X has been unmounted.
	exit 0
else
	echo "Check sum verification failed"
	exit 1
fi
