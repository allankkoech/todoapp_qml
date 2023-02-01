#include "qmlinterface.h"


QmlInterface::QmlInterface(QObject *parent)
    : QObject{parent}
{

}

QString QmlInterface::generateGUID()
{
    return QUuid::createUuid().toString(QUuid::WithoutBraces);
}
