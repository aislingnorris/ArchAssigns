// Copyright (C) 2012 - 2015 jones@scss.tcd.ie

#include "stdafx.h"         // pre-compiled headers
#include <iostream>         // cout
#include "conio.h"          // _getch
#include "t1.h"             //

using namespace std;        // cout

// check
void check(char *s, int v, int val)
{
    cout << s << " = " << v;
    if (v == val) {
        cout << " OK";
    } else {
        cout << " ERROR: should be " << val;
    }
    cout << endl;
}

// _tmain
int _tmain(int argc, _TCHAR* argv[])
{
    // tutorial 1
    check("g", g, 256);
    check("p(1, 2)", p(1, 2), 11);
    check("q(2)", q(2), 1015);
    check("f(6)", f(6), 720);
    check("f(1)", f(1), 1);
    check("f(2)", f(2), 2);
    check("f(10)", f(10), 3628800);
    cout << endl;

    _getch();
    return 0;
}
// eof
