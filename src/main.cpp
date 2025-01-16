#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QUrl>
#include <QQuickStyle>
#include <KLocalizedContext>
#include <KLocalizedString>
#include <KIconTheme>
#include <KAboutData>
#include <QIcon>

int main(int argc, char *argv[])
{
    KIconTheme::initTheme();
    QApplication app(argc, argv);
    KLocalizedString::setApplicationDomain("projekt");
    QApplication::setOrganizationName(QStringLiteral("KDE"));
    QApplication::setOrganizationDomain(QStringLiteral("kde.org"));
    QApplication::setApplicationName(QStringLiteral("Projekt"));
    QApplication::setDesktopFileName(QStringLiteral("org.kde.projekt"));
    // QApplication::setWindowIcon(QIcon::fromTheme("projekt"));

    QApplication::setStyle(QStringLiteral("breeze"));
    if (qEnvironmentVariableIsEmpty("QT_QUICK_CONTROLS_STYLE")) {
        QQuickStyle::setStyle(QStringLiteral("org.kde.desktop"));
    }

    KAboutData aboutData(
        QStringLiteral("helloworld"),
        i18nc("@title", "Projekt"),
        QStringLiteral("1.0"),
        i18n("Project Management Application"),
        KAboutLicense::GPL_V3,
        i18n("(c) 2025 Artem Stasyuk"),
        i18nc("@info", "Optional text shown in the About"),
        QStringLiteral("https://kde.org"));

    aboutData.addAuthor(
        i18nc("@info:credit", "Artem Stasyuk"),
        i18nc("@info:credit", "Developer"),
        QStringLiteral("stasyukartem2@gmail.com"),
        QStringLiteral("https://example.org"));

    // Set aboutData as information about the app
    KAboutData::setApplicationData(aboutData);

    // Register a singleton that will be accessible from QML.
    qmlRegisterSingletonType(
        "org.kde.projekt", // How the import statement should look like
        1, 0, // Major and minor versions of the import
        "About", // The name of the QML object
        [](QQmlEngine* engine, QJSEngine *) -> QJSValue {
            // Here we retrieve our aboutData and give it to the QML engine
            // to turn it into a QML type
            return engine->toScriptValue(KAboutData::applicationData());
        }
        );

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));
    engine.loadFromModule("org.kde.projekt.qml", "Main");

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
