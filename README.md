# Qt_Bison_Flex_Calculator
A example , cq template how to implement Qt with Bison & Flex. 

Origially example : https://github.com/destinyelings/qt-bison-flex
Modified by Skynet Cyberdyne :
  - Added auto script instead of manually adding build steps. 
  - Added a easy calculator example from : https://github.com/ckshitij/LEX-AND-YACC
  - Modified the MainWindow to use with calculator.

Things to keep in mind :

  - To create the connection between Qt & Bison/Flex on c-c++ level is quite a dramatic tour. This struct is used by common.h :
  
              scanner.h line 158:
              typedef struct yy_buffer_state *YY_BUFFER_STATE;

Result :

   ![screen01](https://user-images.githubusercontent.com/44880102/164615888-5ab6f431-7554-421f-801c-41d3e634b4b1.jpg)

Install Bison & Flex :

    wget https://github.com/grotius-cnc/Qt_Bison_Flex_Calculator/releases/download/1.0.0/bison_2.3a3.8.2+dfsg-1_amd64.deb
    wget https://github.com/grotius-cnc/Qt_Bison_Flex_Calculator/releases/download/1.0.0/flex_2.6.4-8_amd64.deb
    sudo dpkg -i bison_2.3a3.8.2+dfsg-1_amd64.deb
    sudo dpkg -i flex_2.6.4-8_amd64.deb

Info bison :

    mDepends: m4, libc6 (>= 2.29)
    Suggests: bison-doc

Info flex :

    Depends: libc6 (>= 2.26), m4
    Recommends: gcc | c-compiler, libfl-dev
    At some git repositories you will see the -lfl compile flag hanging around in the Qt.pro file, this will point to the libfl-dev.
