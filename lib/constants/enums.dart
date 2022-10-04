enum BluetoothStatus {
  CONNECTED,
  NOT_CONNECTED,
  CONNECTING,
}

const Map<BluetoothStatus, String> bluetoothStatusEnumToString = {
  BluetoothStatus.CONNECTED: "Connected",
  BluetoothStatus.NOT_CONNECTED: "Not Connected",
};
