using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Validates inputs before use in SQL commands.
/// </summary>
public class Validation {

    /// <summary>
    /// Ensures that a string is between the min and max length, contains no special characters, and sends feedback
    /// </summary>
    /// <param name="input">The source of the input</param>
    /// <param name="name">A description of the input for use in feedback</param>
    /// <param name="min">The min length</param>
    /// <param name="max">The max length</param>
    /// <param name="label">The destination of the feedback</param>
    /// <returns>Whether the string is a valid input</returns>
    public static bool ValidateString(string input, string name, int min, int max, Label label) {

        bool valid = true;

        if (min == max) {
            if (input.Length != min) {
                valid = false;
                label.Text = name + " must be exactly " + min + " characters.";
            }
        } else {
            if (input.Length < min) {
                valid = false;
                label.Text = name + " must be at least " + min + " characters.";
            } else {
                if (input.Length > max) {
                    valid = false;
                    label.Text = name + " must be less than " + max + " characters.";
                }
            }
        }

        if (valid) {
            try {
                if (!Regex.IsMatch(input, "^[a-zA-Z0-9 ]*$")) {
                    valid = false;
                    label.Text = name + " can only contain alphanumeric characters.";
                }
            } catch {
                valid = false;
                label.Text = name + " can only contain alphanumeric characters.";
            }
        }
        if (valid) {
            label.Text = "";
        }
        return valid;
    }

    // See previous overload ^
    public static bool ValidateString(string input, string name, int min, Label label) {
        return ValidateString(input, name, min, Global.MaxChars, label);
    }

    /// <summary>
    /// Ensures that an int is between the min and max length, contains only numerals, and sends feedback
    /// </summary>
    /// <param name="input">The source of the input</param>
    /// <param name="name">A description of the input for use in feedback</param>
    /// <param name="min">The min length</param>
    /// <param name="max">The max length</param>
    /// <param name="label">The destination of the feedback</param>
    /// <returns>Whether the int is a valid input</returns>
    public static bool ValidateInt(string input, string name, int min, int max, Label label) {

        bool valid = true;

        if (min == max) {
            if (input.Length != min) {
                valid = false;
                label.Text = name + " must be exactly " + min + " characters.";
            }
        } else {
            if (input.Length < min) {
                valid = false;
                label.Text = name + " must be at least " + min + " characters.";
            } else {
                if (input.Length > max) {
                    valid = false;
                    label.Text = name + " must be less than " + max + " characters.";
                }
            }
        }

        if (valid) {
            try {
                if (!Regex.IsMatch(input, "^[0-9]*$")) {
                    valid = false;
                    label.Text = name + " can only contain numbers.";
                }
            } catch {
                valid = false;
                label.Text = name + " can only contain numbers.";
            }
        }
        if (valid) {
            label.Text = "";
        }
        return valid;
    }
}