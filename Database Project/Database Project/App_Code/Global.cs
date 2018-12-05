using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// This class stores data that needs to persist between pages.
/// </summary>
public class Global {

    private static int _maxChars = 40;
    private static int _restaurant;
    private static int _menu;

    public static int Restaurant {
        get { return _restaurant; }
        set { _restaurant = value; }
    }

    public static int Menu {
        get { return _menu; }
        set { _menu = value; }
    }

    public static int MaxChars {
        get { return _maxChars; }
    }

}