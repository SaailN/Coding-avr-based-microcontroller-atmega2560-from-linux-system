# Coding-avr-based-microcontroller-atmega2560-on-ubantu-





1) Open new terminal and first run this command to install avr libraries in your terminal.

          sudo apt-get install avr-libc binutils-avr avrdude gcc gcc-avr

2)  Download the file firebird attached and copy to the home directory .

3)  Open the terminal and run the following command.

            sudo  gedit /etc/environment

            On the editor you will find  similar kind of lines like.

       PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:"

       Go to your home directory where you saved firebird folder , open the folder and find the directory of the file firebird.sh by looking in to its properties.

Copy this file directory and paste in the file opened in text editor above.

Now it will look like.

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/saail/firebird"

Save It.

Also open a terminal inside firebird folder and execute following code:

      sudo chmod u+x ./firebird.sh

Restart your pc.



Running c and burning c code:

Connect your usbasp to your board.

Open the terminal where you have written your embedded c code. Type

firebird.sh yourfilename.c       

Inplace of yourfilename enter your file name.

If the code has any compilation error it will be displayed in terminal else it will burn hex file directly to your atmega 2560 controller.


   


       

      
