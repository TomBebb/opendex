#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QString>
#include <QFile>
#include <QCryptographicHash>
#include <iostream>
#include <string>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QDir dir("./Databases");
    if (!dir.exists()) {
        dir.mkpath(".");
    }
    QString new_name = QString(QCryptographicHash::hash(("pokedex"), QCryptographicHash::Md5).toHex());


    QFile file("/home/tom/Downloads/veekun-pokedex.sqlite");
    QString dest = engine.offlineStorageDatabaseFilePath("pokedex") + ".sqlite";
    if(!file.exists()) {
        std::cout << "File should exist\n" << std::flush;
    }
    if(QFile::exists(dest)) {
        QFile::remove(dest);
    }
    if(!file.copy(dest)) {
        std::cout << "File already exists\n" << std::flush;
    }
    file.close();

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
