#include "database.h"
#include <QDir>
#include <QtSql>
#include <QSqlDatabase>
#include <QFile>
#include <QObject>
#include <QSqlError>
#include <QSqlQuery>
#include <QQuickItem>
#include <QDebug>
#include <QStringList>

Database::Database(QQuickItem *parent)
    : QQuickItem(parent)
{
    if ( database.database(name).isValid() == false ) {
        database = QSqlDatabase::addDatabase("QSQLITE", name);
    } else {
        database = QSqlDatabase::database(name);
    }

    database.setConnectOptions("QSQLITE_ENABLE_SHARED_CACHE = 1;");
    database.setDatabaseName("/var/lib/harbour-dolphin-keyboard/database/" + name + ".sqlite");

    database.open();

    QSqlQuery query(database);

    query.exec("PRAGMA synchronous = OFF; PRAGMA journal_mode = OFF; PRAGMA default_cache_size =32768; PRAGMA foreign_keys = OFF; PRAGMA count_changes = OFF; PRAGMA temp_store = qvectorMEMORY");

}


void Database::initial(QString name)
{
    if ( database.database(name).isValid() == false ) {
        database = QSqlDatabase::addDatabase("QSQLITE", name);
    } else {
        database = QSqlDatabase::database(name);
    }

    database.setConnectOptions("QSQLITE_ENABLE_SHARED_CACHE = 1;");
    database.setDatabaseName("/var/lib/harbour-dolphin-keyboard/database/" + name + ".sqlite");

    database.open();

    QSqlQuery query(database);

    query.exec("PRAGMA synchronous = OFF; PRAGMA journal_mode = OFF; PRAGMA default_cache_size =32768; PRAGMA foreign_keys = OFF; PRAGMA count_changes = OFF; PRAGMA temp_store = qvectorMEMORY");

}


QStringList Database::load(QString sql)
{
    QList<QString> temp;

    QSqlQuery query(database);
    query.setForwardOnly(true);

    if( query.exec(sql)) {

        while (query.next()) {
            temp << query.value(0).toString();
        }

    }

    return temp;

}

void Database::update(QString sql)
{

    QSqlQuery query(database);
    query.setForwardOnly(true);
    query.exec(sql);

}

void Database::adjust(QString name, QString word)
{
    QString sql;
    sql = "UPDATE " + name + " SET frequency = frequency + 1 WHERE word = \"" + word + "\"";

    QSqlQuery query(database);
    query.exec(sql);
}

void Database::debug(QString sql)
{
    QSqlQuery query(database);
    query.exec(sql);



    qDebug() << query.lastError();
}


void Database::close(QString name)
{
    //Check database connection exist or not
    if ( database.database(name).isValid() == true ) {
        database = QSqlDatabase::database(name);
        database.close();

    }
}

void Database::index(QString name)
{
    if ( database.database(name).isValid() == true ) {
        database = QSqlDatabase::database(name);
        database.exec("REINDEX");

    }
}



void Database::output(QString sql)
{

    QString result;
    QSqlQuery query(database);

    query.setForwardOnly(true);

    if( query.exec(sql)) {
        while (query.next()) {
            result += query.value(0).toString() + ", " + query.value(1).toInt() + "\n";
        }
    }

    QDir dir;
    QFile *file = new QFile(dir.homePath() + "/Dolphin/" + "user.txt");
    file->open(QFile::Append);

    QFile data(dir.homePath() + "/Dolphin/" + "user.txt");

    if (data.open(QFile::WriteOnly | QFile::Truncate)) {
        QTextStream out(&data);
        out.setCodec("UTF-8");
        out << result;

    }


}



QStringList Database::cangJie(int type, QString keys, QString size)
{

    QString sql;

    switch (type) {

    case 0:

        sql = "SELECT word FROM cangJie3 WHERE keys GLOB \"" + keys + "*\" ORDER BY LENGTH(keys) ASC, sorting DESC,  frequency DESC LIMIT 0, " + size;

        break;
    case 1:
        sql = "SELECT word FROM cangJie5 WHERE keys GLOB \"" + keys + "*\" ORDER BY LENGTH(keys) ASC, sorting DESC,  frequency DESC LIMIT 0, " + size;

        break;
    case 2:

        if ( keys.length() > 0 && keys.length() != 2 && keys.length() < 6 ) {

            sql = "SELECT word FROM cangJie3 WHERE keys GLOB \"" + keys + "*\" ORDER BY frequency DESC, sorting DESC LIMIT 0, " + size;


        } else if ( keys.length() == 2 ) {

            keys = keys.mid(0,1) + "*" + keys.mid(1,1);
            sql = "SELECT word FROM cangJie3 WHERE keys GLOB \"" + keys + "\" ORDER BY frequency DESC, sorting DESC LIMIT 0, " + size;

        }


        break;
    case 3:
        if ( keys.length() > 0 && keys.length() != 2 && keys.length() < 6 ) {

            sql = "SELECT word FROM cangJie5 WHERE ( keys >= \""+ keys + "\" AND keys < \"" + keys + "Ｚ\" ) ORDER BY frequency DESC, sorting DESC LIMIT 0, " + size;

        } else if ( keys.length() == 2 ) {

            keys = keys.mid(0,1) + "*" + keys.mid(1,1);
            sql = "SELECT word FROM cangJie5 WHERE keys GLOB \"" + keys + "\" ORDER BY frequency DESC, sorting DESC LIMIT 0, " + size;

        }

        break;

    }

    return Database::load(sql);

}


QStringList Database::canton(QString keys, QString size)
{
    QString sql;

    sql = "SELECT DISTINCT word FROM canton WHERE keys GLOB \"" + keys.toLower() + "*\" ORDER BY LENGTH(keys) ASC, frequency DESC, sorting DESC LIMIT 0, " + size;

    return Database::load(sql);

}

QStringList Database::stroke(QString keys, QString size)
{
    QString sql;

    sql = "SELECT word FROM stroke WHERE keys GLOB \"" + keys + "*\" ORDER BY frequency DESC, sorting DESC LIMIT 0, " + size;

    return Database::load(sql);

}

QStringList Database::predict(QString word, QString size)
{
    QString sql;
    int prefix = word.length() + 1;
    sql = "SELECT SUBSTR(word," + QString::number(prefix) + ") FROM predict WHERE word GLOB \"" + word + "*\" AND LENGTH(word) - " + QString::number(prefix) + " >= 0 ORDER BY frequency DESC, sorting DESC LIMIT 0, " + size;

    return Database::load(sql);

}


QStringList Database::wubi(int type, QString keys, QString size)
{

    QString sql;

    switch (type) {

    case 0:

        sql = "SELECT word FROM wubi86  WHERE keys GLOB \"" + keys + "*\" ORDER BY LENGTH(keys) ASC, sorting DESC,  frequency DESC LIMIT 0, " + size;

        break;
    case 1:
        sql = "SELECT word FROM wubi86 WHERE keys GLOB \"" + keys + "*\" ORDER BY LENGTH(keys) ASC, sorting DESC,  frequency DESC LIMIT 0, " + size;
        break;
    }

    return Database::load(sql);

}

QStringList Database::swype(QString keys, QString count, QString size)
{


    QString sql;

    keys = keys.left(1) + "*[" + keys.mid(1, keys.length() - 1) + "]*" + keys.right(1);
    sql = "SELECT word FROM swype WHERE word GLOB \"" + keys + "\" ORDER BY LENGTH(word) ASC, sorting DESC, frequency DESC LIMIT 0, " + size;


    return Database::load(sql);

}
