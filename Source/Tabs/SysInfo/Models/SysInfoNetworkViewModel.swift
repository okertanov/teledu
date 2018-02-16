//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

//
// Network menu item
//
class SysInfoNetworkViewModel: SysInfoDetailsViewModel {
    var entries: [String: CommonTypes.GenericBlockTypeR<String>] = [
        "Host Name": SysInfoNetworkViewModel.getHostName,
        "IP Address": SysInfoNetworkViewModel.getIpAddress,
        "Internet": SysInfoNetworkViewModel.getInternetReachability
    ]
    
    override var itemsCount: Int {
        return entries.count
    }
    
    override func getItemAt(_ idx: Int) -> SysInfoItem? {
        let entrie = entries.dropFirst(idx).first!
        return SysInfoItem(title: entrie.key, description: entrie.value())
    }
    
    private static func getHostName() -> String {
        let name = "\(UIDevice.current.name)"
        return name
    }
    
    private static func getIpAddress() -> String {
        guard let ipAddress = getIpAddressImpl() else {
            return "Unknown"
        }
        return ipAddress
    }
    
    private static func getIpAddressImpl() -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
            freeifaddrs(ifaddr)
        }
        return address
    }
    
    private static func getInternetReachability() -> String {
        let reachable  = getInternetReachabilityImpl() ? "Reachable" : "Limited"
        return reachable
    }
    
    private static func getInternetReachabilityImpl() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
    }
}
