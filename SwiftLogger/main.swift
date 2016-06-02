//
//  main.swift
//  SwiftLogger
//
//  Created by Sergey Rump on 01.06.2016.
//  Copyright © 2016 SR3u. All rights reserved.
//

import Foundation

class Test
{
    func test()
    {
        Log.e(self,"Hello Logger ERROR")
        Log.w(self,"Hello Logger WANRING")
        Log.i(self,"Hello Logger INFO")
        Log.fixme(self,"Hello Logger FIXME")
        Log.d(self,"Hello Logger DEBUG")
        Log.v(self,"Hello Logger VERBOSE")
        Log.t(self,"Hello Logger TRACE")
        Log.fatal(self,"Hello Logger FATAL")
    }
}
struct TestStruct
{
    func test()
    {
        Log.e(self,"Hello Logger ERROR")
        Log.w(self,"Hello Logger WANRING")
        Log.i(self,"Hello Logger INFO")
        Log.fixme(self,"Hello Logger FIXME")
        Log.d(self,"Hello Logger DEBUG")
        Log.v(self,"Hello Logger VERBOSE")
        Log.t(self,"Hello Logger TRACE")
        Log.fatal(self,"Hello Logger FATAL")
    }
}

Log.printFullInfo = false

let t = Test()
t.test()
let ts = TestStruct()
ts.test()

Log.i("All is OK")