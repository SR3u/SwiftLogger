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
        Log.e(self,"Logger ERROR")
        Log.w(self,"Logger WANRING")
        Log.i(self,"Logger INFO")
        Log.fixme(self,"Logger FIXME")
        Log.d(self,"Logger DEBUG")
        Log.v(self,"Logger VERBOSE")
        Log.t(self,"Logger TRACE")
        Log.fatal(self,"Logger FATAL")
    }
}
struct TestStruct
{
    func test()
    {
        Log.e(self,"Logger ERROR")
        Log.w(self,"Logger WANRING")
        Log.i(self,"Logger INFO")
        Log.fixme(self,"Logger FIXME")
        Log.d(self,"Logger DEBUG")
        Log.v(self,"Logger VERBOSE")
        Log.t(self,"Logger TRACE")
        Log.fatal(self,"Logger FATAL")
    }
}

Log.setAllTagsEnabled(false)


let t = Test()
t.test()
let ts = TestStruct()
ts.test()

Log.i("All is OK")
