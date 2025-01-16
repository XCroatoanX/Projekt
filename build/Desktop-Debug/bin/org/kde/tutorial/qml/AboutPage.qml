import org.kde.kirigamiaddons.formcard 1.0 as FormCard
import org.kde.example 1.0

FormCard.AboutPage {
    title: i18nc("@action:button", "About")
    aboutData: {
        "displayName" : "Projekt",
        "productName" : "Projekt",
        "componentName" : "addonsexample",
        "shortDescription" : "Project Manager for KDE",
        "homepage" : "https://kde.org",
        "bugAddress" : "stasyukartem2@gmail.com",
        "version" : "1.0",
        "otherText" : "Optional text shown in the About",
        "authors" : [
            {
                "name" : "Artem Stasyuk",
                "task" : "Maintainer",
                "emailAddress" : "stasyukartem2@gmail.com",
                "webAddress" : "",
                "ocsUsername" : "XCroatoanX"
            }
        ],
        "credits" : [],
        "translators" : [],
        "licenses" : [
            {
                "name" : "GPL v3",
                "text" : "Long license text goes here",
                "spdx" : "GPL-3.0"
            }
        ],
        "copyrightStatement" : "© 2025",
        "desktopFileName" : ""
    }

}
