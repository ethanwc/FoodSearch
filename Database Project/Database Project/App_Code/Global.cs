/// <summary>
/// Stores data that needs to persist between pages.
/// Josh Lichty
/// </summary>
public class Global {

    private static int _maxChars = 25;
    private static int _restaurant;
    private static int _menu;
    private static string _displayName;

    // Holds the value of a restaurant in management view
    public static int Restaurant {
        get { return _restaurant; }
        set { _restaurant = value; }
    }

    // Holds the value of a menu in management view
    public static int Menu {
        get { return _menu; }
        set { _menu = value; }
    }

    // The max length of a string to be inserted in a field
    public static int MaxChars {
        get { return _maxChars; }
    }

    // The current user's display name
    public static string DisplayName {
        get { return _displayName; }
        set { _displayName = value; }
    }

}