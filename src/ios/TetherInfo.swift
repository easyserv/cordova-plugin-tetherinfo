import SystemConfiguration


@objc(TetherInfo) class TetherInfo : CDVPlugin {


  @objc(listip:)
  func listip(command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    let msg = "hello"

    if msg.characters.count > 0 {
      pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK,
        messageAs: msg
      )
    }

    self.commandDelegate.send(
      pluginResult,
      callbackId: command.callbackId
    )
  }

  @objc(checkusb:)
  func checkusb(command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    //SCDynamicStoreRef sc = SCDynamicStoreCreate(NULL, CFSTR("com.apple.wirelessmodemsettings.MISManager"), NULL, NULL);
    //NSDictionary* info = (__bridge_transfer NSDictionary*)SCDynamicStoreCopyValue(sc, CFSTR("com.apple.MobileInternetSharing"));
    //CFRelease(sc);

    let sc = SCDynamicStoreCreate(nil, "com.apple.wirelessmodemsettings.MISManager" as CFString, nil, nil)
    let info = SCDynamicStoreCopyValue(sc, "com.apple.MobileInternetSharing" as CFString)
    CFRelease(sc)

    //let msg = info

    if (val != nil) {
      pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK,
        messageAs: val!["Hosts.Type.USB-Ethernet"] as! Uint
      )
    }

    self.commandDelegate.send(
      pluginResult,
      callbackId: command.callbackId
    )
  }
}
