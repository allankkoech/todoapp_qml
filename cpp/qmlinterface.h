#ifndef QMLINTERFACE_H
#define QMLINTERFACE_H

#include <QObject>
#include <QUuid>

class QmlInterface : public QObject
{
    Q_OBJECT
public:
    explicit QmlInterface(QObject *parent = nullptr);

    Q_INVOKABLE static QString generateGUID();

signals:

};

#endif // QMLINTERFACE_H
