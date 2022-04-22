#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QDebug>
#include <QDir>
#include <QFile>
#include <QFileDialog>
#include <QLabel>
#include <QSpinBox>
#include <iostream>

#include "testparser.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_parseButton_clicked()
{
    QByteArray content(ui->lineEdit_input->text().toUtf8());
    TestParser parser(content);

    foreach (const ParseElement& e, parser.elements()) {
        std::cout<<"result:"<<e.value<<std::endl;
        ui->plainTextEdit_result->appendPlainText("Result: "+QString::number(e.value,'f',3));
    }
}



