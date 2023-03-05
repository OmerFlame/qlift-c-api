// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CQlift",
    products: [
        .library(
            name: "CQlift",
            type: .static,
            targets: [
                "CQlift"
            ]
        )
    ],
    targets: [
        .target(
            name: "CQlift",
            dependencies: [
                .target(
                    name: "CQt5Widgets",
                    condition: .when(platforms: [.linux])
                )
            ],
            path: "src/qlift-c-api",
            publicHeadersPath: ".",
            cxxSettings: [
                .unsafeFlags([
                        "-I/usr/local/opt/qt/lib/QtCore.framework/Headers",
                        "-I/usr/local/opt/qt/lib/QtGui.framework/Headers",
                        "-I/usr/local/opt/qt/lib/QtWidgets.framework/Headers",
                        "-I/usr/local/opt/qt/include",
                        "-I/opt/homebrew/opt/qt@5/lib/QtWidgets.framework/Headers",
                        "-I/opt/homebrew/opt/qt@5/lib/QtCore.framework/Headers",
                        "-I/opt/homebrew/opt/qt@5/lib/QtGui.framework/Headers",
                        "-I/opt/homebrew/opt/qt@5/include/"
                    ],
                    .when(platforms: [.macOS])
                )
            ],
            linkerSettings: [
                .unsafeFlags([
                        "/usr/local/opt/qt/lib/QtCore.framework/QtCore",
                        "/usr/local/opt/qt/lib/QtGui.framework/QtGui",
                        "/usr/local/opt/qt/lib/QtWidgets.framework/QtWidgets",
                        "/opt/homebrew/opt/qt@5/lib/QtCore.framework/QtCore",
                        "/opt/homebrew/opt/qt@5/lib/QtGui.framework/QtGui",
                        "/opt/homebrew/opt/qt@5/lib/QtWidgets.framework/QtWidgets",
                    ],
                    .when(platforms: [.macOS])
                )
            ]
        ),
        .systemLibrary(
            name: "CQt5Widgets",
            pkgConfig: "Qt5Widgets",
            providers: [.brewItem(["qt@5"])]
        )
    ],
    cxxLanguageStandard: .cxx1z
)
