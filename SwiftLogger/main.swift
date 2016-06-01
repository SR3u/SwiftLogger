//
//  main.swift
//  SwiftLogger
//
//  Created by Sergey Rump (SPHERE) on 01.06.2016.
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
    }
}
struct TestStr
{
    func test()
    {
        Log.e(self,"Hello Logger ERROR")
        Log.w(self,"Hello Logger WANRING")
        Log.i(self,"Hello Logger INFO")
        Log.fixme(self,"Hello Logger FIXME")
        Log.d(self,"Hello Logger DEBUG")
    }
}

Log.printFullInfo = false

let t = Test()
t.test()
let ts = TestStr()
ts.test()

Log.i("All is OK")