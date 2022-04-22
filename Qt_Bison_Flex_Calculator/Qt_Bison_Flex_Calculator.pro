QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Qt_Bison_Flex_Calculator
TEMPLATE = app

CONFIG +=make QMAKE_CLEAN

SOURCES += main.cpp\
        mainwindow.cpp \
    testparser.cpp \
    parser.cpp \
    scanner.cpp

HEADERS  += mainwindow.h \
    testparser.h \
    common.h \
    parser.h \
    scanner.h

FORMS    += mainwindow.ui

DISTFILES += \
    parser.y \
    scanner.l \
    script \
    script.sh \
    text.txt

# Compile the .y & .l file's with Bison & Flex by a script file.
# To turn the scripting ofd and add extra build steps manually, you can visit the ~/Docs/Extra_Build_Settings.jpg.
# The script will ensure you will get updated sources & header files after a "make clean !!" for :
#
#       - parser.h
#       - parser.cpp
#       - scanner.h
#       - scanner.cpp
#
QMAKE_PRE_LINK += $$PWD/script.sh $$PWD

# If you deleted the sources and headers try manually run :
# Where the -d flag is for creating source and header files.
#       $ bison -d parser.y
#       $ lex -d scanner.l

