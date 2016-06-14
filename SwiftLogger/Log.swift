//
//  Log.swift
//  SwiftLogger
//
//  Created by Sergey Rump on 01.06.2016.
//  Copyright © 2016 SR3u. All rights reserved.
//

import Foundation

public class Log
{
    // configuration
    static public var printFullInfo = false
    static public var useNSLog = true
    
    static public var enableWarning = true
    static public var enableDebug = true
    static public var enableVerbose = true
    static public var enableInfo = true
    static public var enableTrace = true
    static public var enableFixme = true
    
    static public func setAllTagsEnabled(_ value:Bool)
    {
        enableWarning = value
        enableDebug = value
        enableVerbose = value
        enableInfo = value
        enableTrace = value
        enableFixme = value
    }
    
    
    static public func e(_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.e(nil, message,function: function,file: file,line: line)
    }
    static public func e(_ caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        var tag = "ERROR [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "ERROR [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }
    
    static public func w(_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.w(nil, message,function: function,file: file,line: line)
    }
    static public func w(_ caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        var tag = "WARN [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "WARN [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }
    
    static public func d(_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.d(nil, message,function: function,file: file,line: line)
    }
    static public func d(_ caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        if !enableDebug {return}
        var tag = "DEBUG [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "DEBUG [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }
    
    static public func t(_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.d(nil, message,function: function,file: file,line: line)
    }
    static public func t(_ caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        if !enableTrace {return}
        var tag = "TRACE [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "TRACE [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }
    
    static public func fatal(_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.d(nil, message,function: function,file: file,line: line)
    }
    static public func fatal(_ caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        var tag = "FATAL [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "FATAL [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }

    
    static public func fixme(_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.fixme(nil, message,function: function,file: file,line: line)
    }
    static public func fixme(_ caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        if !enableFixme {return}
        var tag = "FIXME [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "FIXME [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }
    
    static public func i(_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.i(nil, message,function: function,file: file,line: line)
    }
    static public func i(_ caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        if !enableInfo {return}
        var tag = "INFO [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "INFO [\(file) \(line) \(self.getTypeName(caller,function:function))]: \n"
        }
        self.log(tag, message: message)
    }
    static public func v(_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.v(nil, message,function: function,file: file,line: line)
    }
    static public func v(_ caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        if !enableVerbose {return}
        var tag = "VERBOSE [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "VERBOSE [\(file) \(line) \(self.getTypeName(caller,function:function))]: \n"
        }
        self.log(tag, message: message)
    }

    
    static private func getTypeName(_ caller:Any? = nil, function:String = "")->String
    {
        guard let caller = caller else {return "\(function)"}
        return "\(caller.dynamicType).\(function)"
    }
    static private func log(_ tag: String, message: String)
    {
        if useNSLog
        {
            NSLog("\(tag)\(message)")
        }
        else
        {
            print("\(tag)\(message)")
        }
    }
}
