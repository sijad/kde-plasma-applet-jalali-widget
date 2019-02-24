import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0

import "jalaali.js" as Jalaali
import "utils.js" as JSUtils

Item {
  id: root

  readonly property date currentDateTime: dataSource.data.Local ? dataSource.data.Local.DateTime : new Date()
  readonly property var jalali: Jalali { id: jalali }

  width: jalali.width
  height: jalali.height
  Layout.minimumWidth: jalali.width
  Layout.minimumHeight: jalali.height
  Plasmoid.switchWidth: jalali.width
  Plasmoid.switchHeight: jalali.height

  Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation
  Plasmoid.compactRepresentation: Jalali {}
  Plasmoid.fullRepresentation: Jalali {}

  PlasmaCore.DataSource {
    id: dataSource
    engine: "time"
    connectedSources: ["Local"]
    interval: 60000
    intervalAlignment: PlasmaCore.Types.AlignToMinute
  }

  function timeString() {
    var j = Jalaali.toJalaali(currentDateTime)
    return "" + formatTime(j.jy) + "/" + formatTime(j.jm) + "/" + formatTime(j.jd)
  }

  function formatTime(num) {
    var str = "" + num
    if (str.length == 1) {
      str = "0" + str
    }
    return JSUtils.convertToPersianDigits(str.slice(-2))
  }
}
