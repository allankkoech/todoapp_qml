#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>

#include "qmlinterface.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon("qrc:/assets/img/logo.png"));
    app.setApplicationDisplayName("Todo List");
    app.setApplicationVersion("0.0.1");
    app.setOrganizationName("DevQt Developers");
    app.setOrganizationDomain("ke.devqt");

    QmlInterface qmlInterface;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("QmlInterface", &qmlInterface);

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
