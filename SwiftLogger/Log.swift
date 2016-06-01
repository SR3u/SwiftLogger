//
//  Log.swift
//  SwiftLogger
//
//  Created by Sergey Rump (SPHERE) on 01.06.2016.
//  Copyright © 2016 SR3u. All rights reserved.
//

import Foundation

public class Log
{
    // configuration
    static public var printFullInfo = true
    static public var useNSLog = true
    
    
    
    static public func e(message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.e(nil, message,function: function,file: file,line: line)
    }
    static public func e(caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        var tag = "ERROR [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "ERROR [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }
    
    static public func w(message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.w(nil, message,function: function,file: file,line: line)
    }
    static public func w(caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        var tag = "WARN [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "WARN [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }
    
    static public func d(message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.d(nil, message,function: function,file: file,line: line)
    }
    static public func d(caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        var tag = "DEBUG [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "DEBUG [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }
    
    
    static public func fixme(message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.fixme(nil, message,function: function,file: file,line: line)
    }
    static public func fixme(caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        var tag = "FIXME [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "FIXME [\(file) \(line) \(self.getTypeName(caller,function:function))]:\n"
        }
        self.log(tag, message: message)
    }
    
    static public func i(message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        self.i(nil, message,function: function,file: file,line: line)
    }
    static public func i(caller: Any?,_ message: String, function: String = #function, file: String = #file, line: Int = #line)
    {
        var tag = "INFO [\(self.getTypeName(caller,function:function))]: "
        if printFullInfo
        {
            tag = "INFO [\(file) \(line) \(self.getTypeName(caller,function:function))]: \n"
        }
        self.log(tag, message: message)
    }
    
    static private func getTypeName(caller:Any? = nil, function:String = "")->String
    {
        guard let caller = caller else {return "\(function)"}
        return "\(caller.dynamicType).\(function)"
    }
    static private func log(tag: String, message: String)
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