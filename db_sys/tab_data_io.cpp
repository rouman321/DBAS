#include "tab_data_io.h"
#include "ui_tab_data_io.h"

tab_data_IO::tab_data_IO(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::tab_data_IO)
{
    ui->setupUi(this);
}

tab_data_IO::~tab_data_IO()
{
    delete ui;
}

void tab_data_IO::on_pushButton_clicked()
{
    ui->pushButton->hide();
}