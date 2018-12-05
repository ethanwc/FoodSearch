using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Validation
/// </summary>
public class Validation {

    public static bool ValidateString(string input, string name, int min, Label label) {
        return ValidateString(input, name, min, Global.MaxChars, label);
    }

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