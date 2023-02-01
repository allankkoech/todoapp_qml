import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.LocalStorage 2.15

import "pages"


Window {
    id: app
    width: 840
    height: 480
    visible: true
    title: qsTr("Todo App")

    property string themeColor: "#fd752d"
    property alias mainStack: mainStack
    property alias todolistModel: _todoModel
    property alias fontAwesomeFontLoader: fontAwesomeFontLoader

    Component.onCompleted: {
        if(initDb()) // Initialize database
        {
            fetchTodos();
        }
    }

    ListModel {
        id: _todoModel

        //        onCountChanged: {
        //            console.log("...............................................")
        //            for(var i=0; i<count; i++) {
        //                console.log(JSON.stringify(_todoModel.get(i)))
        //            }
        //            console.log("...............................................")
        //        }
    }

    onClosing: {
        if(mainStack.depth <= 2) {
            close.accepted = true
            return;
        }

        // Pop page if back button clicked on android
        close.accepted = false
        mainStack.pop()
    }

    StackView {
        id: mainStack
        anchors.fill: parent

        initialItem: Splash {}
    }

    FontLoader {
        id: fontAwesomeFontLoader
        source: "qrc:/assets/fonts/fontawesome.otf"
    }

    // ---------------------------------------------------------------
    // ---------------- NAVIGATION -----------------------------------
    // ---------------------------------------------------------------

    function navigateTo(page) {
        if(page==="history") mainStack.push("qrc:/qml/pages/HistoryPage.qml")
        else if(page==="new") mainStack.push("qrc:/qml/pages/AddTodoPage.qml")
        else mainStack.push("qrc:/qml/pages/SettingsPage.qml")
    }


    // ----------------------------------------------------------------
    // ---------------------  DATABASE FUNCTIONS   --------------------
    // ----------------------------------------------------------------

    function getDb() {
        return LocalStorage.openDatabaseSync("TodoListDatabase", "1.0", "Db for all tasks!", 1000000);
    }

    function getUUID() {
        return QmlInterface.generateGUID();
    }

    function initDb() {
        try {
            var db = getDb()

            db.transaction(
                        function(tx) {
                            // Create the database if it doesn't already exist
                            tx.executeSql('CREATE TABLE IF NOT EXISTS Todos
                                        (
                                            uid TEXT UNIQUE NOT NULL,
                                            todo TEXT NOT NULL,
                                            dateAdded TEXT NOT NULL,
                                            dateEndS TEXT NOT NULL,
                                            dateEndE TEXT NOT NULL,
                                            done BOOL
                                        )');
                        }
                        );

            return true;
        }

        catch(e) {
            console.log(e)
        }

        return false;
    }

    function addTodo(todo) {
        var db = getDb();
        var uid = getUUID();
        var dt = new Date().toISOString()

        // console.log("-- ", uid, dt)

        try {
            db.transaction(
                        function(tx) {
                            // Create the database if it doesn't already exist
                            tx.executeSql('INSERT INTO Todos(uid, todo, dateAdded, dateEndS, dateEndE, done) VALUES(?, ?, ?, ?, ?, ?)',
                                          [uid, todo, dt, dt, dt, false]);
                        }
                        );

            // Fetch fetchTodos()
            fetchTodos();

            return true;
        }

        catch(e) {
            console.log(e)
        }
        return false;
    }

    function fetchTodos() {
        var db = getDb();
        // var dt = new Date().toISOString()

        try {
            db.transaction(
                        function(tx) {
                            // Create the database if it doesn't already exist
                            var rs = tx.executeSql('SELECT uid, todo, dateAdded, dateEndS, dateEndE, done FROM Todos ORDER BY dateAdded DESC');

                            // Process todos

                            // Clear model
                            todolistModel.clear();

                            for (var i = 0; i < rs.rows.length; i++) {
                                var item = rs.rows.item(i);

                                todolistModel.append(
                                            {
                                                uid: item.uid,
                                                dateAdded: item.dateAdded,
                                                dateDue: {
                                                    from: item.dateEndS,
                                                    to: item.dateEndE
                                                },
                                                todo: item.todo,
                                                done: item.done
                                            }
                                            );
                            }
                        }
                        );

            return true;
        }

        catch(e) {
            console.log(e)
        }
        return false;
    }

    function updateTodoDone(todoUid, _done) {
        var db = getDb();
        // var dt = new Date().toISOString()

        try {
            db.transaction(function(tx) {
                // Create the database if it doesn't already exist
                tx.executeSql('UPDATE Todos SET done = ? WHERE uid = ?', [_done, todoUid]);
            });

            fetchTodos();
            return true;
        }

        catch(e) {
            console.log(e)
        }
        return false;
    }
}
