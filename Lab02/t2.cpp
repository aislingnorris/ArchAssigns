//
// Copyright (C) 2012 - 2015 jones@scss.tcd.ie
//

#include "stdafx.h"   // pre-compiled headers
#include "t2.h"     // header file
#include <iostream>     // cout
#include <conio.h>    // _getch

using namespace std;     // cout


//
// check
//
void check(char *s, _int64 v, _int64 val)
{
    cout << s << " = " << v;
    if (v == val) {
        cout << " OK";
    } else {
        cout << " ERROR: should be " << val;
    }
    cout << endl;
}

//
// _tmain
//
int _tmain(int argc, _TCHAR* argv[])
{

    //printf("hello world\n");

    //
    // tutorial 2
    //
    check("g", g, 256);
    check("p(1, 2)", p(1, 2), 11);
    check("(q(2)", q(2), 1015);
    check("xp5(1, 2, 3, 4, 5)", xp5(1, 2, 3, 4, 5), 15);
    check("f(6)", f(6), 720);
    cout << endl;


    //
    // xp2
    //
    //check("xp2(7, 11)", xp2(7, 11), 18);

    _getch();

    return 0;
}
// eof

